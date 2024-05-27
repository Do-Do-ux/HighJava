package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao {

	// 멤버 전체 리스트
	public List<MemberVO> memList();

	public MemberVO memberdetail(String memId);

}