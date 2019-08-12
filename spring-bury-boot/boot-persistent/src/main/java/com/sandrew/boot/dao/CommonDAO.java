package com.sandrew.boot.dao;

import com.sandrew.boot.core.exception.DAOException;
import com.sandrew.bury.Session;
import com.sandrew.bury.SqlSessionFactory;
import com.sandrew.bury.bean.PO;
import com.sandrew.bury.exception.POException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 *
 *  通用的CRUD操作DAO
 * Created by summer on 2019/7/26.
 */
@Slf4j
@Repository
public class CommonDAO
{
    @Resource
    SqlSessionFactory sessionFactory;

    /**
     *  新增
     * @param po
     * @return
     * @throws DAOException
     */
    public <T> int insert(T po) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            return session.insert((PO) po);
        }
        catch (POException e)
        {
            log.error("insert " + po.getClass() + " error!");
            throw new DAOException();
        }
    }

    /**
     *  删除
     * @param po
     * @return
     * @throws DAOException
     */
    public <T> int delete(T po) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            return session.delete((PO) po);
        }
        catch (POException e)
        {
            log.error("delete " + po.getClass() + " error!");
            throw new DAOException();
        }
    }

    /**
     *  更新
     * @param cond
     * @param value
     * @return
     */
    public <T> int update(T cond, T value) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            return session.update((PO) cond, (PO) value);
        }
        catch (POException e)
        {
            log.error("update " + cond.getClass() + " error!");
            throw new DAOException();
        }
    }

    /**
     *  查询
     * @param cond
     * @return
     */
    public <T> List<T> select(T cond) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            return session.select((PO) cond);
        }
        catch (POException e)
        {
            log.error("query " + cond.getClass() + " error!");
            throw new DAOException();
        }
    }

    /**
     *  根据ID查询
     * @param cond
     * @return
     */
    public <T> T selectById(T cond) throws DAOException
    {
        try
        {
            Session session = sessionFactory.openSession();
            return session.selectById(cond);
        }
        catch (POException e)
        {
            log.error("query " + cond.getClass() + " error!");
            throw new DAOException();
        }
    }
}
