package com.sandrew.mvc.dao;

import com.sandrew.bury.Session;
import com.sandrew.bury.SqlSessionFactory;
import com.sandrew.bury.callback.DAOCallback;
import com.sandrew.mvc.bean.AclUserBean;
import com.sandrew.mvc.bean.MenuBean;
import com.sandrew.mvc.bean.RoleTreeNode;
import com.sandrew.mvc.core.common.Constants;
import com.sandrew.mvc.core.exception.DAOException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by summer on 2019/7/26.
 */
@Slf4j
@Repository
public class LoginDAO
{
    @Resource
    SqlSessionFactory sessionFactory;

    public List<MenuBean> getMenuInfo(Integer roleId) throws DAOException
    {
        Session session = sessionFactory.openSession();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT DISTINCT\n");
        sql.append("	tf.function_id,\n");
        sql.append("	tf.function_code,\n");
        sql.append("	tf.function_name,\n");
        sql.append("	tf.father_func,\n");
        sql.append("	tf.access_url,\n");
        sql.append("	tf.icon\n");
        sql.append("FROM tm_role tr,\n");
        sql.append("     tr_role_func trf,\n");
        sql.append("     tm_function tf\n");
        sql.append("WHERE tr.role_id = trf.role_id\n");
        sql.append("AND trf.function_id = tf.function_id\n");
        sql.append("AND tr.role_status = ?\n");
        sql.append("AND tf.function_status = ?\n");
        sql.append("AND tr.role_id = ?\n");
        sql.append("ORDER BY function_order");
        List<Object> params = new ArrayList<Object>();
        params.add(Constants.STATUS_ENABLE);
        params.add(Constants.STATUS_ENABLE);
        params.add(roleId);
        return session.select(sql.toString(), params, new DAOCallback<MenuBean>()
        {
            @Override
            public MenuBean wrapper(ResultSet rs, int index) throws SQLException
            {

                MenuBean menuBean = new MenuBean();
                menuBean.setImgUrl(rs.getString("icon"));
                menuBean.setFuncId(rs.getString("function_id"));
                menuBean.setFuncCode(rs.getString("function_code"));
                menuBean.setFuncName(rs.getString("function_name"));
                menuBean.setParentId(rs.getString("father_func"));
                menuBean.setFunctionUrl(rs.getString("access_url"));
                return menuBean;
            }
        });
    }
    
    public List<RoleTreeNode> selectRoleForChoice(Integer userId) throws DAOException
    {
        Session session = sessionFactory.openSession();
        StringBuilder sql = new StringBuilder();
        sql.append("select tr.role_id as id,tr.role_name as name, 0 as pid, 'false' as isparent\n");
        sql.append("from tm_user tu \n");
        sql.append("left join tr_user_role tur on tu.user_id = tur.user_id\n");
        sql.append("left join tm_role tr on tur.role_id = tr.role_id\n");
        sql.append("where tu.user_status = ?\n");
        sql.append("and tu.is_delete = ?\n");
        sql.append("and tr.is_delete = ?\n");
        sql.append("and tr.role_status = ?\n");
        sql.append("and tu.user_id = ?");
        List<Object> params = new ArrayList<Object>();
        params.add(Constants.STATUS_ENABLE);
        params.add(Constants.IF_TYPE_NO);
        params.add(Constants.IF_TYPE_NO);
        params.add(Constants.STATUS_ENABLE);
        params.add(userId);
        return session.select(sql.toString(), params, new DAOCallback<RoleTreeNode>()
        {
            @Override
            public RoleTreeNode wrapper(ResultSet rs, int index) throws SQLException
            {
                RoleTreeNode node = new RoleTreeNode();
                node.setId(rs.getString("id"));
                node.setpId(rs.getString("pid"));
                node.setName(rs.getString("name"));
                node.setIsParent(rs.getString("isparent"));
                return node;
            }
        });
    }
    
    public List<AclUserBean> selectRoleByUserCode(String userCode) throws DAOException
    {
        Session session = sessionFactory.openSession();
        StringBuilder sql = new StringBuilder();
        sql.append("select tr.role_id,tr.role_code,tr.role_name from tm_user tu \n");
        sql.append("left join tr_user_role tur on tu.user_id = tur.user_id\n");
        sql.append("left join tm_role tr on tur.role_id = tr.role_id\n");
        sql.append("where tu.user_status = ?\n");
        sql.append("and tr.role_status = ?\n");
        sql.append("and tu.is_delete = ?\n");
        sql.append("and tr.is_delete = ?\n");
        sql.append("and tu.user_code = ?");
        List<Object> params = new ArrayList<Object>();
        params.add(Constants.STATUS_ENABLE);
        params.add(Constants.STATUS_ENABLE);
        params.add(Constants.IF_TYPE_NO);
        params.add(Constants.IF_TYPE_NO);
        params.add(userCode);
        return session.select(sql.toString(), params, new DAOCallback<AclUserBean>()
        {
            @Override
            public AclUserBean wrapper(ResultSet rs, int index) throws SQLException
            {
                AclUserBean aclUserBean= new AclUserBean();
                aclUserBean.setRoleId(rs.getInt("role_id"));
                aclUserBean.setRoleName(rs.getString("role_name"));
                aclUserBean.setRoleCode(rs.getString("role_code"));
                return aclUserBean;
            }
        });
    }
}
