package com.sandrew.mvc.dao;

import com.sandrew.bury.Session;
import com.sandrew.bury.SqlSessionFactory;
import com.sandrew.bury.bean.PageResult;
import com.sandrew.bury.callback.POCallBack;
import com.sandrew.bury.exception.POException;
import com.sandrew.bury.util.Parameters;
import com.sandrew.mvc.bean.AclUserBean;
import com.sandrew.mvc.core.common.Constants;
import com.sandrew.mvc.core.exception.DAOException;
import com.sandrew.mvc.model.RolePO;
import com.sandrew.mvc.model.UserPO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by summer on 2019/7/26.
 */
@Slf4j
@Repository
public class UserManagerDAO
{
    @Resource
    SqlSessionFactory sessionFactory;

    public PageResult<UserPO> userManagerPageQuery(UserPO condition, int curPage) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            List<Object> param = new ArrayList<Object>();
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT  tu.user_id ,\n");
            sql.append("	tu.user_code ,\n");
            sql.append("	tu.user_name ,\n");
            sql.append("	tu.sex ,\n");
            sql.append("	tu.user_status ,\n");
            sql.append("	tu.phone ,\n");
            sql.append("	tu.mobile ,\n");
            sql.append("	tu.email ,\n");
            sql.append("	tr.role_code ,\n");
            sql.append("	group_concat(tr.role_name) AS role_name\n");
            sql.append("FROM tm_user tu\n");
            sql.append("LEFT JOIN tr_user_role tur ON tu.user_id = tur.user_id\n");
            sql.append("LEFT JOIN(\n");
            sql.append("	SELECT tm_role.role_id ,\n");
            sql.append("	       tm_role.role_code ,\n");
            sql.append("	       tm_role.role_name\n");
            sql.append("	FROM tm_role\n");
            sql.append("	WHERE tm_role.is_delete = ?\n");
            param.add(Constants.IF_TYPE_NO);
            sql.append("	AND tm_role.role_status = ?\n");
            param.add(Constants.STATUS_ENABLE);
            sql.append(") tr ON tr.role_id = tur.role_id\n");
            sql.append("WHERE	1 = 1\n");
            if (null != condition.getUserCode() && !"".equals(condition.getUserCode()))
            {
                sql.append("AND user_code LIKE ?\n");
                param.add("%" + condition.getUserCode() + "%");
            }
            if (null != condition.getUserName() && !"".equals(condition.getUserName()))
            {
                sql.append("AND user_name LIKE ?\n");
                param.add("%" + condition.getUserName() + "%");
            }
            if (null != condition.getUserStatus())
            {
                sql.append("AND user_status = ?\n");
                param.add(condition.getUserStatus());
            }
            sql.append("AND tu.is_delete = ?\n");
            param.add(Constants.IF_TYPE_NO);
            sql.append("GROUP BY user_code, is_delete");
            return session.pageQuery(sql.toString(), param, new POCallBack(UserPO.class), Constants.PAGE_SIZE, curPage);
        }
        catch (POException e)
        {
            log.error("分页查询用户信息出错");
            throw new DAOException(e.getMessage(), e);
        }
    }

    public int updateUserInfo(UserPO user) throws DAOException
    {
        try
        {
//            多数据源/分布式事务测试代码
//            Session sessionOra = sessionFactory.openSession("oracle");
//            int count = sessionOra.update("UPDATE TT_TEST_ORA SET BIRTHDAY = SYSDATE WHERE ID = 10000055", null);
//            //int count = sessionOra.update("UPDATE tt_test SET name = ? WHERE id = ?", new Parameters(new Date().toString(), 6).getParams());
//            System.out.println("count ============= " + count);

            Session session = sessionFactory.openSession();
            UserPO cond = new UserPO();
            cond.setUserId(user.getUserId());

            UserPO value = user;
            value.setUserId(null);
            return session.update(cond, value);
        }
        catch (Exception e)
        {
            log.error("更新用户信息失败");
            throw new DAOException(e.getMessage(), e);
        }
    }

    public List<RolePO> queryRelationRole(Integer userId) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            StringBuilder sql = new StringBuilder();
            sql.append("select tr.* from tm_role tr JOIN tr_user_role tur ON tr.role_id = tur.role_id WHERE tur.user_id = ?");
            return session.select(sql.toString(), new Parameters(userId).getParams(), new POCallBack(RolePO.class));
        }
        catch (Exception e)
        {
            log.error("查询关联角色失败");
            throw new DAOException(e.getMessage(), e);
        }
    }

    public List<RolePO> getRoleExistOwn(AclUserBean aclUserBean) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            StringBuilder sql = new StringBuilder();
            sql.append("select\n");
            sql.append("	tr.role_id,\n");
            sql.append("	tr.role_code,\n");
            sql.append("	tr.role_name,\n");
            sql.append("	tr.role_type\n");
            sql.append("from tm_role tr\n");
            sql.append("where tr.role_status = ?\n");
            sql.append("and not exists (\n");
            sql.append("	select 1\n");
            sql.append("	from tr_user_role tur\n");
            sql.append("	where r.role_id = tur.role_id\n");
            sql.append("	and tur.user_id = ?\n");
            sql.append("	and tr.role_type = ?\n");
            Parameters parameters = new Parameters(Constants.STATUS_ENABLE, aclUserBean.getUserId(), 20121001);
            if (null != aclUserBean.getRoleName() && !"".equals(aclUserBean.getRoleName()))
            {
                sql.append("	and tr.role_name like ?");
                parameters.addLikeParam(aclUserBean.getRoleName());
            }
            return session.select(sql.toString(), parameters.getParams(), new POCallBack(RolePO.class));
        }
        catch (Exception e)
        {
            log.error("查询未关联角色失败");
            throw new DAOException(e.getMessage(), e);
        }
    }

    public int updateClearAvatar(Map<String, Object> paramMap) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            StringBuilder sql = new StringBuilder();
            sql.append("update\n");
            sql.append("	tm_user tu \n");
            sql.append("set \n");
            sql.append("	tu.avatar = null,\n");
            sql.append("	tu.update_date = ?,\n");
            sql.append("	tu.update_by = ?\n");
            sql.append("where \n");
            sql.append("	tu.user_id = ?");
            return session.update(sql.toString(), new Parameters(paramMap.get("updateDate"), paramMap.get("updateBy"), paramMap.get("userId")).getParams());
        }
        catch (Exception e)
        {
            log.error("删除头像失败");
            throw new DAOException(e.getMessage(), e);
        }
    }
}
