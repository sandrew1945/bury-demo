/**
 *   自动生成的PO,不要手动修改
 *
 */
package com.sandrew.mvc.model;

import com.sandrew.bury.annotations.TableName;
import com.sandrew.bury.annotations.ColumnName;
import com.sandrew.bury.bean.PO;
import java.util.Date;

@TableName("tm_role")
public class RolePO extends PO
{

    public RolePO()
    {
    }

                                            
    public RolePO(Integer roleId)
    {
        this.roleId = roleId;
    }

    @ColumnName(value = "role_id", isPK = true, autoIncrement = true)
    private Integer roleId;

    @ColumnName(value = "role_code", isPK = false, autoIncrement = false)
    private String roleCode;

    @ColumnName(value = "role_name", isPK = false, autoIncrement = false)
    private String roleName;

    @ColumnName(value = "role_type", isPK = false, autoIncrement = false)
    private Integer roleType;

    @ColumnName(value = "role_status", isPK = false, autoIncrement = false)
    private Integer roleStatus;

    @ColumnName(value = "is_delete", isPK = false, autoIncrement = false)
    private Integer isDelete;

    @ColumnName(value = "create_by", isPK = false, autoIncrement = false)
    private Integer createBy;

    @ColumnName(value = "create_date", isPK = false, autoIncrement = false)
    private Date createDate;

    @ColumnName(value = "update_by", isPK = false, autoIncrement = false)
    private Integer updateBy;

    @ColumnName(value = "update_date", isPK = false, autoIncrement = false)
    private Date updateDate;


    public void setRoleId(Integer roleId)
    {
        this.roleId = roleId;
    }
        
    public Integer getRoleId()
    {
        return this.roleId;
    }
    public void setRoleCode(String roleCode)
    {
        this.roleCode = roleCode;
    }
        
    public String getRoleCode()
    {
        return this.roleCode;
    }
    public void setRoleName(String roleName)
    {
        this.roleName = roleName;
    }
        
    public String getRoleName()
    {
        return this.roleName;
    }
    public void setRoleType(Integer roleType)
    {
        this.roleType = roleType;
    }
        
    public Integer getRoleType()
    {
        return this.roleType;
    }
    public void setRoleStatus(Integer roleStatus)
    {
        this.roleStatus = roleStatus;
    }
        
    public Integer getRoleStatus()
    {
        return this.roleStatus;
    }
    public void setIsDelete(Integer isDelete)
    {
        this.isDelete = isDelete;
    }
        
    public Integer getIsDelete()
    {
        return this.isDelete;
    }
    public void setCreateBy(Integer createBy)
    {
        this.createBy = createBy;
    }
        
    public Integer getCreateBy()
    {
        return this.createBy;
    }
    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }
        
    public Date getCreateDate()
    {
        return this.createDate;
    }
    public void setUpdateBy(Integer updateBy)
    {
        this.updateBy = updateBy;
    }
        
    public Integer getUpdateBy()
    {
        return this.updateBy;
    }
    public void setUpdateDate(Date updateDate)
    {
        this.updateDate = updateDate;
    }
        
    public Date getUpdateDate()
    {
        return this.updateDate;
    }
}