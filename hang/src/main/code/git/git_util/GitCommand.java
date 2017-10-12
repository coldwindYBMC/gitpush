package git.git_util;

import java.io.File;
import java.io.IOException;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.PullCommand;
import org.eclipse.jgit.api.errors.CheckoutConflictException;
import org.eclipse.jgit.api.errors.GitAPIException;
import org.eclipse.jgit.api.errors.InvalidRefNameException;
import org.eclipse.jgit.api.errors.JGitInternalException;
import org.eclipse.jgit.api.errors.RefAlreadyExistsException;
import org.eclipse.jgit.api.errors.RefNotFoundException;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.transport.UsernamePasswordCredentialsProvider;

public class GitCommand {

	private final String USR = "zhangyuhang";
	private final String PASSWORD = "yuhang1994.1118";
//	private static GitCommand instance = null;
	private  UsernamePasswordCredentialsProvider usernamePasswordCredentialsProvider;

//	public static synchronized GitCommand getInstance() {
//		if (instance == null) {
//			instance = new GitCommand();
//		}
//		return instance;
//	}
	
	public GitCommand() {
		usernamePasswordCredentialsProvider = new UsernamePasswordCredentialsProvider(USR, PASSWORD);
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

	@SuppressWarnings("resource")
	public void gitCheckout(File repoDir, String version) {
		File RepoGitDir = new File(repoDir.getAbsolutePath() + "/.git");
		if (!RepoGitDir.exists()) {
			System.out.println("Error! Not Exists : " + RepoGitDir.getAbsolutePath());
		} else {
			Repository repo = null;
			try {
				repo = new FileRepository(RepoGitDir.getAbsolutePath());
				Git git = new Git(repo);
				git.checkout()
					.setName(version)
					.call();
				System.out.println("Checkout to " + version);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (RefAlreadyExistsException e) {
				e.printStackTrace();
			} catch (RefNotFoundException e) {
				e.printStackTrace();
			} catch (InvalidRefNameException e) {
				e.printStackTrace();
			} catch (CheckoutConflictException e) {
				e.printStackTrace();
			} catch (GitAPIException e) {
				e.printStackTrace();
			}
			System.out.println("Checkout to " + version);
		}
	}

	@SuppressWarnings("resource")
	public void gitPull(File repoDir) {
		File RepoGitDir = new File(repoDir.getAbsolutePath() + "/.git");
		if (!RepoGitDir.exists()) {
			System.out.println("Error! Not Exists : " + RepoGitDir.getAbsolutePath());
		} else {
			Repository repo = null;
			try {
				repo = new FileRepository(RepoGitDir.getAbsolutePath());
				Git git = new Git(repo);
				PullCommand pullCmd = git.pull();
				pullCmd.setCredentialsProvider(usernamePasswordCredentialsProvider).call();
				pullCmd.setCredentialsProvider(usernamePasswordCredentialsProvider).call();
				
				System.out.println("Pulled from remote repository to local repository at " + repo.getDirectory());
			} catch (Exception e) {
				System.out.println(e.getMessage() + " : " + RepoGitDir.getAbsolutePath());
			} finally {
				if (repo != null) {
					repo.close();
				}
			}
		}
	}

	@SuppressWarnings("resource")
	public void gitCommit(File file) throws IOException, GitAPIException, JGitInternalException {
		Git git = new Git(new FileRepository(file.getAbsolutePath() + "/.git"));
		git.commit().setMessage("推表").call();
		System.out.println("commit:" + file.getAbsolutePath() + "/.git");
	}

	/**
	 * 本地仓库新增文件
	 */
	@SuppressWarnings("resource")
	public void gitAdd(File file) throws IOException, GitAPIException {
		Git git = new Git(new FileRepository(file.getAbsolutePath() + "/.git"));
		git.add().addFilepattern(".").call();
		System.out.println("add:" + file.getAbsolutePath() + "/.git");
	}

	/**
	 * push本地代码到远程仓库地址
	 */
	@SuppressWarnings("resource")
	public void gitPush(File file) throws IOException, JGitInternalException, GitAPIException {

		Git git = new Git(new FileRepository(file.getAbsolutePath() + "/.git"));
		git.push().setRemote("origin").setCredentialsProvider(usernamePasswordCredentialsProvider).call();
		System.out.println("push:" + file.getAbsolutePath() + "/.git");
	}

}
