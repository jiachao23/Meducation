package com.meducation.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

import com.opensymphony.xwork2.ActionSupport;

public class FaceUploadAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File filedata;// 上传的文件（此名称默认，如想修改请修改uploadify的fileObjName选项）
	private String filedataFileName;// 上传的文件名
	private String filedataContentType;// 上传文件类型的属性

	public File getFiledata() {
		return filedata;
	}

	public void setFiledata(File filedata) {
		this.filedata = filedata;
	}

	public String getFiledataFileName() {
		return filedataFileName;
	}

	public void setFiledataFileName(String filedataFileName) {
		this.filedataFileName = filedataFileName;
	}

	public String getFiledataContentType() {
		return filedataContentType;
	}

	public void setFiledataContentType(String filedataContentType) {
		this.filedataContentType = filedataContentType;
	}
	/**
	 * 上传文件
	 * 
	 * @throws IOException
	 * 
	 * @since 2014-1-16
	 */
	public void uploadFile() throws IOException {

		// 如果有文件
		if (filedata != null) {

			// 创建存放路径
			String filePathDir = "D:\\IMAGE";
			// 根据路径创建文件夹对象
			File importSaveFile = new File(filePathDir);

			if (!importSaveFile.exists()) {
				importSaveFile.mkdirs();// 如果目录不存在就创建
			}

			// 文件名+后缀
			String saveFileName = "唯一文件名" + "."
					+ FilenameUtils.getExtension(filedataFileName);

			File tarFile = new File(filePathDir + "//" + saveFileName);
			FileUtils.copyFile(filedata, tarFile);
		}

	}
}
