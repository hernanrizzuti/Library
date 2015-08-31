package com.fdm.model.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.regex.Pattern;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

public class ImageIO {

	private final String IMAGE_PATTERN = "([^\\s]+(\\.(?i)(jpeg|jpg|png|gif|bmp))$)";
	private Pattern pattern;
	String filename = null;

	public boolean isFileExtensionValid(MultipartFile file) {
		pattern = Pattern.compile(IMAGE_PATTERN);
		return pattern.matcher(file.getOriginalFilename()).matches();
	}

	public String bookImagewriter(MultipartFile file, String booktitle) throws IOException{
		BufferedOutputStream stream = null;
		byte[] bytes = file.getBytes();
		File dir = dirGenerator();
		File serverFile = fileGenerator(dir, file, booktitle);
		stream = getBufferedOutputStream(serverFile);
		stream.write(bytes);
		stream.flush();
		stream.close();
		return filename;
	}

	public File dirGenerator() {
		String rootPath = System.getProperty("catalina.home");
		File dir = new File(rootPath + "/uploads/Library/imgs/");
		if (!dir.exists()){
			dir.mkdirs();
		}
		return dir;
	}

	public File fileGenerator(File dir, MultipartFile file, String booktitle) {
		File image = null;
		filename = fileNameGenerator(file, booktitle);
		image = new File(dir.getAbsolutePath()+ File.separator + filename);
		while(image.exists()){
			int num = (int )(Math.random() * 1250 + 1);
			image = fileGenerator(dir, file, booktitle+num);
		}
		return image;
	}

	public String fileNameGenerator(MultipartFile file, String booktitle) {
		String suffix = FilenameUtils.getExtension(file.getOriginalFilename());
		String prefix = booktitle.toLowerCase().replaceAll("\\s+","");
		String filename = prefix + "." + suffix;
		return filename;
	}

	public BufferedOutputStream getBufferedOutputStream(File serverFile)
			throws FileNotFoundException {
		return new BufferedOutputStream(new FileOutputStream(serverFile));
	}
}