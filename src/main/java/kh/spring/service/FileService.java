package kh.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.FileDAO;
import kh.spring.dto.FileDTO;

@Service
public class FileService {

	@Autowired
	private FileDAO fdao;
	
	
	public int fileUpload(int boardseq, MultipartFile file, String realPath) throws Exception {
		File filesPath = new File(realPath); 
	     if(!filesPath.exists()) { filesPath.mkdir(); }
	     
	     List<FileDTO> list = new ArrayList<>();
	     
	    
	           String oriName = file.getOriginalFilename(); 
	           String sysName = UUID.randomUUID().toString().replace("-", "") + "_" + oriName;
	          file.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
	           list.add(new FileDTO(0, oriName, sysName, boardseq));

	      
		
	     Map<String,Object> map = new HashMap<>();
	     map.put("list", list);
	     
		return fdao.fileUpload(map);
	}
	
	
}
