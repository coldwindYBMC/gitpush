package git;

import java.io.IOException;
import java.util.Properties;

public class PropertiesFile {
	private static Properties instance = null;
	private static final String fileName = "resconf.properties";
	
	public static Properties getInstance() {
		if(instance == null) {
			instance = new Properties();
			try {
				instance.load(PropertiesFile.class.getClassLoader().getResourceAsStream(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}	
		return instance;
	}
	
	private PropertiesFile() {
		
	}
}
