package com.comme.shelterAnimal_board;

import org.springframework.stereotype.Component;

@Component
public class ShelterAnimalDTO {
	private String desertionNo, popfile, happenDt, kindCd, orgNm, happenPlace, specialMark, careNm,
					careTel, careAddr, processState;
	
	public ShelterAnimalDTO() {}

	public ShelterAnimalDTO(String desertionNo, String popfile, String happenDt, String kindCd, String orgNm,
			String happenPlace, String specialMark, String careNm, String careTel, String careAddr,
			String processState) {
		super();
		this.desertionNo = desertionNo;
		this.popfile = popfile;
		this.happenDt = happenDt;
		this.kindCd = kindCd;
		this.orgNm = orgNm;
		this.happenPlace = happenPlace;
		this.specialMark = specialMark;
		this.careNm = careNm;
		this.careTel = careTel;
		this.careAddr = careAddr;
		this.processState = processState;
	}

	public String getDesertionNo() {
		return desertionNo;
	}

	public void setDesertionNo(String desertionNo) {
		this.desertionNo = desertionNo;
	}

	public String getPopfile() {
		return popfile;
	}

	public void setPopfile(String popfile) {
		this.popfile = popfile;
	}

	public String getHappenDt() {
		return happenDt;
	}

	public void setHappenDt(String happenDt) {
		this.happenDt = happenDt;
	}

	public String getKindCd() {
		return kindCd;
	}

	public void setKindCd(String kindCd) {
		this.kindCd = kindCd;
	}

	public String getOrgNm() {
		return orgNm;
	}

	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}

	public String getHappenPlace() {
		return happenPlace;
	}

	public void setHappenPlace(String happenPlace) {
		this.happenPlace = happenPlace;
	}

	public String getSpecialMark() {
		return specialMark;
	}

	public void setSpecialMark(String specialMark) {
		this.specialMark = specialMark;
	}

	public String getCareNm() {
		return careNm;
	}

	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}

	public String getCareTel() {
		return careTel;
	}

	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}

	public String getCareAddr() {
		return careAddr;
	}

	public void setCareAddr(String careAddr) {
		this.careAddr = careAddr;
	}

	public String getProcessState() {
		return processState;
	}

	public void setProcessState(String processState) {
		this.processState = processState;
	}

	@Override
	public String toString() {
		return desertionNo + " : " + popfile + " : " + happenDt
				+ " : " + kindCd + " : " + orgNm + " : " + happenPlace + " : "
				+ specialMark + " : " + careNm + " : " + careTel + " : " + careAddr
				+ " : " + processState;
	}
}
