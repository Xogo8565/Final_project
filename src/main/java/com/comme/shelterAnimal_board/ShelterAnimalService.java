package com.comme.shelterAnimal_board;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class ShelterAnimalService implements ShelterAnimalDAO {
	@Autowired
	private ShelterAnimalDTO dto = new ShelterAnimalDTO();
	@Autowired
	private ShelterAnimalDAO dao;

	public String callAPI(StringBuilder urlBuilder) throws Exception { // api 호출 메서드
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
	    System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
//	    System.out.println(sb.toString());
		
		return sb.toString();
	}
	
	public String dbInsertData() throws Exception { // 유기동물 전체 리스트 DB저장
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=Fc6DTpA8Yu57vCWOu4bErC49Kd89spOL6F2x8Cq9EtEvZPHFNlg%2BfBrhYa2D7PwsXoVABtrP7Spf153fRqx0%2Fw%3D%3D"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /* 한 페이지 결과 수(1,000 이하) */
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* xml(기본값) 또는 json */
		
		String rs = callAPI(urlBuilder);
		// 반환받은 json 형태의 문자열을 실제 Gson 라이브러리가 가지고 있는 JsonElement 형태로 변환
		JsonElement obj = JsonParser.parseString(rs);
		// response 라는 key에 담겨있는 데이터를 JsonObject 형태로 변환
		JsonObject resp = obj.getAsJsonObject().get("response").getAsJsonObject();
		// body 라는 key에 담겨있는 데이터를 JsonObject 형태로 변환한 후 items 안에 담겨있는 걸 또 JsonObject 로 변환
		JsonObject items = resp.get("body").getAsJsonObject().get("items").getAsJsonObject();
		// 마지막으로 item 안에 담겨있는 객체배열 형태의 데이터(실제 필요한 데이터)를 JsonArray 형태로 변환
		JsonArray item = items.get("item").getAsJsonArray();

		for (JsonElement i : item) {
			// 각각의 JsonElement를 object로 가져와 get 메서드를 통해 각각의 데이터 뽑아내기
			JsonObject dto1 = i.getAsJsonObject();

			dto.setDesertionNo((dto1.get("desertionNo").toString().replaceAll("\"", "")));
			dto.setPopfile((dto1.get("popfile").toString().replaceAll("\"", "")));
			dto.setHappenDt((dto1.get("happenDt").toString().replaceAll("\"", "")));
			dto.setKindCd((dto1.get("kindCd").toString().replaceAll("\"", "")));
			dto.setOrgNm((dto1.get("orgNm").toString().replaceAll("\"", "")));
			dto.setHappenPlace((dto1.get("happenPlace").toString().replaceAll("\"", "")));
			dto.setColorCd((dto1.get("colorCd").toString().replaceAll("\"", "")));
			dto.setAge((dto1.get("age").toString().replaceAll("\"", "")));
			dto.setWeight((dto1.get("weight").toString().replaceAll("\"", "")));
			dto.setSexCd((dto1.get("sexCd").toString().replaceAll("\"", "")));
			dto.setSpecialMark((dto1.get("specialMark").toString().replaceAll("\"", "")));
			dto.setCareNm((dto1.get("careNm").toString().replaceAll("\"", "")));
			dto.setCareTel((dto1.get("careTel").toString().replaceAll("\"", "")));
			dto.setCareAddr((dto1.get("careAddr").toString().replaceAll("\"", "")));
			dto.setProcessState((dto1.get("processState").toString().replaceAll("\"", "")));
			
			dao.insert(dto);
		}
		return rs;
	}

	public String getJSON(int curPage) throws Exception { // 유기동물 리스트 호출
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /* URL */
		String pageNum = Integer.toString(curPage);
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=Fc6DTpA8Yu57vCWOu4bErC49Kd89spOL6F2x8Cq9EtEvZPHFNlg%2BfBrhYa2D7PwsXoVABtrP7Spf153fRqx0%2Fw%3D%3D"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); /* 한 페이지 결과 수(1,000 이하) */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNum, "UTF-8")); /* 페이지 번호 */
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* xml(기본값) 또는 json */

		return callAPI(urlBuilder);
	}
	
	public String selectUpkind(int curPage, String upkind) throws Exception { // 축종코드로 검색
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /* URL */
		String pageNum = Integer.toString(curPage);
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=Fc6DTpA8Yu57vCWOu4bErC49Kd89spOL6F2x8Cq9EtEvZPHFNlg%2BfBrhYa2D7PwsXoVABtrP7Spf153fRqx0%2Fw%3D%3D"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("12", "UTF-8")); /* 한 페이지 결과 수(1,000 이하) */
		urlBuilder.append("&" + URLEncoder.encode("upkind", "UTF-8") + "=" + URLEncoder.encode(upkind, "UTF-8")); /* 축종코드 */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNum, "UTF-8")); /* 페이지 번호 */
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* xml(기본값) 또는 json */
		
		return callAPI(urlBuilder);
	}

	public ShelterAnimalDTO selectDetail(String desertionNo) throws Exception { // 상세페이지 호출	
		return dao.selectDetail(desertionNo);
	}

	public Map<String, Object> getPageNavi(int curPage) { // API 페이징
		int totalCnt = 10000; // 전체 게시글의 개수
		int recordCntPerPage = 12; // 한 페이지당 게시글 개수
		int naviCntPerPage = 10; // 네비바에 몇개 단위로 페이징을 구성할지
		
		return getPage(curPage, totalCnt, recordCntPerPage, naviCntPerPage);
	}
	
	public Map<String, Object> getDbPageNavi(int curPage) { // Db 페이징
		int totalCnt = dao.selectTotalCnt(); 
		int recordCntPerPage = 12; 
		int naviCntPerPage = 10; 
		
		return getPage(curPage, totalCnt, recordCntPerPage, naviCntPerPage);
	}
	
	public Map<String, Object> getDbSearchPageNavi(int curPage, String keyword) { // Db select 페이징
		int totalCnt = dao.selectKeywordCount(keyword); 
		int recordCntPerPage = 12; 
		int naviCntPerPage = 10; 
		
		return getPage(curPage, totalCnt, recordCntPerPage, naviCntPerPage);
	}

	public Map<String, Object> getPage(int curPage, int totalCnt, int recordCntPerPage, int naviCntPerPage) {
		int pageTotalCnt = 0; // 총 페이지 개수
		
		if (totalCnt % recordCntPerPage > 0) {
			pageTotalCnt = totalCnt / recordCntPerPage + 1;
		} else {
			pageTotalCnt = totalCnt / recordCntPerPage;
		}

		if (curPage < 1) {
			curPage = 1;
		} else if (curPage > pageTotalCnt) {
			curPage = pageTotalCnt;
		}

		int startNavi = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + naviCntPerPage - 1;

		if (pageTotalCnt < endNavi) {
			endNavi = pageTotalCnt;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCnt) {
			needNext = false;
		}

		Map<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);
		
		return map;
	}
	
	public List<ShelterAnimalDTO> selectAll(int start, int end) { // DB에서 리스트 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return dao.selectAll(map);
	}

	public List<ShelterAnimalDTO> selectKeyword(int start, int end, String Keyword) { // DB에서 검색
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", Keyword);
		
		return dao.selectKeyword(map);
	}

	@Override
	public void insert(ShelterAnimalDTO dto) {
	}
	
	@Override
	public List<ShelterAnimalDTO> selectAll(Map<String, Object> map) { 
		return null;
	}
	
	@Override
	public List<ShelterAnimalDTO> selectKeyword(Map<String, Object> map) {
		return null;
	}
	
	@Override
	public int selectTotalCnt() {
		return 0;
	}

	@Override
	public int selectKeywordCount(String keyword) {
		return 0;
	}

}
