package com.sandrew.mvc.dao;
import com.sandrew.bury.Session;
import com.sandrew.bury.SqlSessionFactory;
import com.sandrew.bury.bean.PageResult;
import com.sandrew.bury.callback.POCallBack;
import com.sandrew.bury.exception.POException;
import com.sandrew.bury.util.Parameters;
import com.sandrew.mvc.bean.RoleFunctionBean;
import com.sandrew.mvc.core.common.Constants;
import com.sandrew.mvc.core.exception.DAOException;
import com.sandrew.mvc.model.FunctionPO;
import com.sandrew.mvc.model.RolePO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by summer on 2019/7/26.
 */
@Slf4j
@Repository
public class RoleManagerDAO
{
    @Resource
    SqlSessionFactory sessionFactory;

    public PageResult<RolePO> roleManagerPageQuery(RolePO condition, int curPage) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT role_id ,\n");
            sql.append("role_code ,\n");
            sql.append("role_name ,\n");
            sql.append("role_type ,\n");
            sql.append("role_status ,\n");
            sql.append("create_by ,\n");
            sql.append("create_date ,\n");
            sql.append("update_by ,\n");
            sql.append("update_date\n");
            sql.append("FROM tm_role\n");
            sql.append("WHERE 1 = 1\n");
            sql.append("AND is_delete = ?\n");
            Parameters parameters = new Parameters();
            parameters.addParam(Constants.IF_TYPE_NO);
            if (null != condition.getRoleCode() && !"".equals(condition.getRoleCode()))
            {
                sql.append("and role_code like ?\n");
                parameters.addLikeParam(condition.getRoleCode());
            }
            if (null != condition.getRoleName() && !"".equals(condition.getRoleName()))
            {
                sql.append("and role_name like ?\n");
                parameters.addLikeParam(condition.getRoleName());
            }
            if (null != condition.getRoleType())
            {
                sql.append("and role_type = ?\n");
                parameters.addParam(condition.getRoleType());
            }
            return session.pageQuery(sql.toString(), parameters.getParams(), new POCallBack(RolePO.class), Constants.PAGE_SIZE, curPage);
        }
        catch (POException e)
        {
            log.error("分页查询用户信息出错");
            throw new DAOException(e.getMessage(), e);
        }
    }
    
    public List<FunctionPO> roleFuncByRoleId(Integer roleId) throws DAOException
    {
        Session session = sessionFactory.openSession();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT tf.* FROM tm_function tf\n");
        sql.append("JOIN tr_role_func trf ON tf.function_id = trf.function_id\n");
        sql.append("WHERE tf.is_delete = ?\n");
        sql.append("AND trf.role_id = ?");
        List<Object> param = new ArrayList<Object>();
        param.add(Constants.IF_TYPE_NO);
        param.add(roleId);
        return session.select(sql.toString(), param, new POCallBack(FunctionPO.class));
    }
    
    public List<FunctionPO> getFuncExistOwn(RoleFunctionBean roleFunctionBean) throws DAOException
    {
        Session session = sessionFactory.openSession();
        StringBuilder sql = new StringBuilder();
        sql.append("select *\n");
        sql.append("from (select *\n");
        sql.append(" from tm_function tf\n");
        sql.append(" where not exists (select 1\n");
        sql.append("	  from tr_role_func trf\n");
        sql.append("	  where tf.function_id = trf.function_id\n");
        sql.append("	  and trf.role_id = ?)) t\n");
        sql.append("where t.is_delete = ?\n");
        Parameters parameters = new Parameters(roleFunctionBean.getRoleId(), Constants.IF_TYPE_NO);
        if (null != roleFunctionBean.getFunctionName() && !"".equals(roleFunctionBean.getFunctionName()))
        {
            sql.append("and t.function_name like ?");
            parameters.addParam(roleFunctionBean.getFunctionName());
        }
        return session.select(sql.toString(), parameters.getParams(), new POCallBack(FunctionPO.class));
    }
}
