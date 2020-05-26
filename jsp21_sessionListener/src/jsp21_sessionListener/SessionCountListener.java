package jsp21_sessionListener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
/*
 * HttpSessionListener -> ������ �����ǰų� ����ɶ��� ���� �̺�Ʈ�� ó���ϴ� ������ Ŭ����
 */
public class SessionCountListener implements HttpSessionListener {
	private static int userCount =0;

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("������ �����Ǿ����");
		userCount++;
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("������ ����Ǿ����");
		userCount--;
	}
	
	public static int getUserCount() {
		return userCount;
	}
	
}
