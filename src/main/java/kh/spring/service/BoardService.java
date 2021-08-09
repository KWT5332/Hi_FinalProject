package kh.spring.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.config.BoardConfig;
import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;

@Service
public class BoardService {

	
	@Autowired
	private BoardDAO bdao;
	
	public int boardWrite(BoardDTO dto) {
		return bdao.boardWrite(dto);
	}
	
	public int seqNextval() {
		return bdao.seqNextval();
	}
	
	public List<BoardDTO> boardlist(int cpage) {
		int endNum = cpage * BoardConfig.RECORD_COUNT_PER_PAGE;
		int startNum = (endNum - BoardConfig.RECORD_COUNT_PER_PAGE) - 1;
		
		Map<String,Integer> param = new HashMap<>();
		param.put("startNum", startNum);
		param.put("endNum", endNum);
		
		return bdao.boardList(param);
	}
	
	public List<String> navi(int currentPage) {
		int totalCount = this.getTotalCount(); // 총 글의 수
		int pagewriteCount = BoardConfig.RECORD_COUNT_PER_PAGE;
		int pageNaviCount = BoardConfig.NAVI_COUNT_PER_PAGE;

		int pageTotalCount = 0; // 몇개의 페이지가 필요한가 -> 페이지의 총개수
		if(totalCount % pagewriteCount > 0) {
			pageTotalCount = totalCount / pagewriteCount + 1; // 나머지가있으면 한페이지가 더 있어야됨
		}else {
			pageTotalCount = totalCount / pagewriteCount;
		}

		if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}else if(currentPage < 1) {
			currentPage = 1;
		}

		int startNavi = (((currentPage - 1) / pageNaviCount) * pageNaviCount) + 1;

		int endNavi = startNavi + (pageNaviCount -1);
		if(endNavi > pageTotalCount) { endNavi = pageTotalCount; }

		boolean needPrev = true;
		boolean needNext = true;
		if (startNavi == 1) {needPrev = false;}
		if (endNavi == pageTotalCount) {needNext = false;}

		List<String> pageNavi = new ArrayList<>(); // 전체 페이지의 수를 담는 배열

		if (needPrev) {pageNavi.add("<");}

		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi.add(String.valueOf(i));
		}

		if (needNext) {pageNavi.add(">");}

		return pageNavi;
	}
	
	private int getTotalCount() {
		return bdao.getTotalCount();
	}
}
