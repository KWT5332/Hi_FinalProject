package kh.spring.config;

import org.springframework.stereotype.Repository;

@Repository
public class BoardConfig {
	public static int RECORD_COUNT_PER_PAGE = 10; // 한 페이지당 보여준 개시물의 개수
	public static int NAVI_COUNT_PER_PAGE = 10; // 내 위치 페이지를 기준으로 시작부터 끝까지의 페이지가 총 몇개인지
}

