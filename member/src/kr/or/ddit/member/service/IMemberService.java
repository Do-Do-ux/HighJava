package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {

	public List<MemberVO> memList();
	
	public MemberVO memberdetail(String memId);

	public int idcheck(String id);


	public int memberAdd(MemberVO mv);

	public int modifyMember(MemberVO member);

	public int memberDelete(String memId);


}
