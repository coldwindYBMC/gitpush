package git.git_util;

import java.io.File;
import java.io.IOException;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.errors.GitAPIException;
import org.eclipse.jgit.api.errors.JGitInternalException;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.transport.UsernamePasswordCredentialsProvider;

import git.PropertiesFile;

public class GitCommand {

	private final String USR = "zhangyuhang";
	private final String PASSWORD = "yuhang1994.1118";
	private static GitCommand instance = null;
	private final UsernamePasswordCredentialsProvider usernamePasswordCredentialsProvider;
	private final File repoFile;
	private Git git;

	public static synchronized GitCommand getInstance() {
		if (instance == null) {
			instance = new GitCommand();
		}
		return instance;
	}

	private GitCommand() {
		usernamePasswordCredentialsProvider = new UsernamePasswordCredentialsProvider(USR, PASSWORD);
		repoFile = new File(PropertiesFile.getInstance().getProperty("gitAddress") + "/.git");
		if (!repoFile.exists()) {
			System.out.println("该文件不存在" + repoFile.getAbsolutePath());
		}
	}

	/**
	 * 得到git
	 */
	private Git getGit() {
		Repository repo = null;
		try {
			repo = new FileRepository(repoFile);
			git = new Git(repo);
			if (git == null) {
				System.out.println("git is null");
				return null;
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (repo != null) {
				repo.close();
			}
		}
		return git;
	}

	public boolean gitClone(String remoteUrl, File repoDir) {
		try {
			Git git = Git.cloneRepository().setCredentialsProvider(usernamePasswordCredentialsProvider)
					.setURI(remoteUrl).setDirectory(repoDir).call();
			System.out.println("Cloning from " + remoteUrl + " to " + git.getRepository());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	/**
	 * 切换分支
	 */
	public void gitCheckout(String version) {
		try {
			getGit().checkout().setName(version).call();
		} catch (GitAPIException e) {
			e.printStackTrace();
		}
		System.out.println("Checkout to " + version);
	}

	/**
	 * 拉取,拉取两次
	 */
	public void gitPull() {
		try {
			getGit().pull().setCredentialsProvider(usernamePasswordCredentialsProvider).call();
			getGit().pull().setCredentialsProvider(usernamePasswordCredentialsProvider).call();

			System.out.println("Pulled from remote repository to local repository at " + repoFile.getAbsolutePath());
		} catch (Exception e) {
			System.out.println(e.getMessage() + " : " + repoFile.getAbsolutePath());
		}
	}

	/**
	 * 提交
	 */
	public void gitCommit() throws IOException, GitAPIException, JGitInternalException {
		getGit().commit().setMessage("推表").call();
		System.out.println("commit:" + repoFile.getAbsolutePath());
	}

	/**
	 * 本地仓库新增文件
	 */
	public void gitAdd() throws IOException, GitAPIException {
		getGit().add().addFilepattern(".").call();
		System.out.println("add:" + repoFile.getAbsolutePath());
	}

	/**
	 * push本地代码到远程仓库地址
	 */
	public void gitPush() throws IOException, JGitInternalException, GitAPIException {
		getGit().push().setRemote("origin").setCredentialsProvider(usernamePasswordCredentialsProvider).call();
		System.out.println("push:" + repoFile.getAbsolutePath());
	}

}
