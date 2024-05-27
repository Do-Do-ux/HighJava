package kr.or.ddit.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.MyBatisUtil;

public class MemberDaoImpl implements IMemberDao {
	private static IMemberDao mbDao = new MemberDaoImpl();

	public MemberDaoImpl() {

	}

	public static IMemberDao getInstance() {
		return mbDao;
	}

	@Override
	public List<MemberVO> memList() {
		SqlSession session = MyBatisUtil.getSqlSession(true);

		List<MemberVO> memList = new ArrayList<MemberVO>();

		try {
			memList = session.selectList("member.MemberList");

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return memList;
	}

	@Override
	public MemberVO memberdetail(String memId) {
		SqlSession session = MyBatisUtil.getSqlSession(true);

		MemberVO member = new MemberVO();

		try {
			member = session.selectOne("member.memberdetail", memId);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return member;
	}

	@Override
	public int idcheck(String id) {
		SqlSession session = MyBatisUtil.getSqlSession(true);

		int member = 0;

		try {
			member = session.selectOne("member.idcheck", id);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return member;
	}

}
