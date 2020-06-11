package member.model.service;

import static common.Template.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberServiceImpl {

	public Member idCheck(String userId) {
		SqlSession session = getSqlSession();
		
		Member m = new MemberDao().idCheck(session,userId);
		
		
		return m;
	}

}
