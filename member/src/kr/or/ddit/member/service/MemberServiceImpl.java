package kr.or.ddit.member.service;

import java.util.List;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	private IMemberDao memDao;
	private static IMemberService mbService = new MemberServiceImpl();

	private MemberServiceImpl() {
		memDao = MemberDaoImpl.getInstance();
	}

	public static IMemberService getInstance() {
		if(mbService == null) new MemberDaoImpl();
		return mbService;
	}

	@Override
	public List<MemberVO> memList() {
		return memDao.memList();
	}

	@Override
	public MemberVO memberdetail(String memId) {
		return memDao.memberdetail(memId);
	}

	@Override
	public int idcheck(String id) {
		return memDao.idcheck(id);
	}

	@Override
	public int memberAdd(MemberVO mv) {
		return memDao.memberAdd(mv);
	}

	@Override
	public int modifyMember(MemberVO member) {
		return memDao.modifyMember(member);
		
	}

	@Override
	public int memberDelete(String memId) {
		return memDao.memberDelete(memId);
	}





}
