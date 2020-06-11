package member.model.service;

import member.model.exception.InsertFailException;
import member.model.vo.Member;

public interface MemberService {
	
	Member idCheck(String userId);
	
	int insertMember(Member m) throws InsertFailException;

}
