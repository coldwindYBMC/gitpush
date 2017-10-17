package git.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

import org.springframework.stereotype.Service;

import git.PropertiesFile;

/**
 * 执行svn命令，更新transfer.tables文件
 * 
 * @author zhangyuhang
 *
 */
@Service
public class UpdateResource {
	public void svnCheckOut(String version) {
		String cmd = null;
		delFile();
		
		String svnco = new StringBuffer().append("svnCheckOut").append(version).toString();
		
		cmd = new StringBuffer().append(PropertiesFile.getInstance().getProperty(svnco)).toString();
		try {
			Process process = Runtime.getRuntime().exec(cmd);
			System.out.println(cmd);
			BufferedReader stdInput = new BufferedReader(
					new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
			BufferedReader stdError = new BufferedReader(
					new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));
			String stream = null;
			while ((stream = stdInput.readLine()) != null) {
				System.out.println(new String(stream.getBytes(), "UTF_8"));
			}
			boolean isSuccess = true;
			while ((stream = stdError.readLine()) != null) {
				isSuccess = false;
			}
			System.out.println("svn 检出 from :" + version + isSuccess);
			Thread.sleep(1000);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	private static void delFile() {
		File file1 = new File(PropertiesFile.getInstance().getProperty("svnAddress"));
		deleteFile(file1);
		File file = new File(PropertiesFile.getInstance().getProperty("svnResAddress"));
		deleteFile(file);
//		File file2 = new File(PropertiesFile.getInstance().getProperty("svntransferAddress"));
//		deleteFile(file2);
		File file3 = new File(PropertiesFile.getInstance().getProperty("svningoredAddress"));
		deleteFile(file3);
	}
	
	//递归删除文件夹  
	   private static void deleteFile(File file) { 
		 System.out.println("删除："+file.getName());
	    if (file.exists()) {//判断文件是否存在  
	     if (file.isFile()) {//判断是否是文件  
	      file.delete();//删除文件   
	     } else if (file.isDirectory()) {//否则如果它是一个目录  
	      File[] files = file.listFiles();//声明目录下所有的文件 files[];  
	      for (int i = 0;i < files.length;i ++) {//遍历目录下所有的文件  
	       deleteFile(files[i]);//把每个文件用这个方法进行迭代  
	      }  
	      file.delete();//删除文件夹  
	     }  
	    } else {  
	     System.out.println("所删除的文件不存在");  
	    }  
	   }  
}
