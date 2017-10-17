package git.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import org.eclipse.jgit.api.errors.GitAPIException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.hoolai.game.dbtransfer.Transfer;

import git.git_util.GitCommand;
import git.service.UpdateResource;
import git.PropertiesFile;

@Controller
public class SelectExcel {
	@Autowired
	private UpdateResource upResource;
	
	@RequestMapping("/gitpush")
	public String list(Model model) throws SQLException, IOException {
		return "excelselect";
	}
	
	
	@RequestMapping(value = "push", method = RequestMethod.POST)
	public synchronized String UploadSourceFile(Model model,String version) throws IOException, SQLException, GitAPIException {
		System.out.println(version);
		if(version.equals("")) {
			System.out.println("版本为空");
			return "error";
		}
		upResource.svnCheckOut(version);
		File file = new File(PropertiesFile.getInstance().getProperty("gitAddress"));
		if(!file.exists()) {
			System.out.println(file.getAbsolutePath()+"不存在");
			return "error";
		}
		GitCommand gitCommand = GitCommand.getInstance();
		
		gitCommand.gitCheckout(file,version);
	

		gitCommand.gitPull(file);
		System.out.println("生成文件*******"+ file.getAbsolutePath());
		String[] args = { PropertiesFile.getInstance().getProperty("gitAddress") };
		Transfer.exce(args,version);
		
		
		try {
			gitCommand.gitAdd(file);
			gitCommand.gitCommit(file);                                                                                                                    
			gitCommand.gitPush(file);
		} catch (GitAPIException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return "success";
	}

}
