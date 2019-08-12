package com.sandrew.mvc.controller.usermanager;

import com.sandrew.fileserver.FileServer;
import com.sandrew.fileserver.core.AbstractManager;
import com.sandrew.fileserver.core.FTPManager;
import com.sandrew.mvc.bean.AclUserBean;
import com.sandrew.mvc.controller.BaseController;
import com.sandrew.mvc.core.bean.BaseCondition;
import com.sandrew.mvc.core.common.AjaxResult;
import com.sandrew.mvc.core.common.Constants;
import com.sandrew.mvc.core.exception.ActionException;
import com.sandrew.mvc.core.exception.JsonException;
import com.sandrew.mvc.core.exception.ServiceException;
import com.sandrew.mvc.model.RolePO;
import com.sandrew.mvc.model.UserPO;
import com.sandrew.mvc.service.usermanager.UserManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Controller
@RequestMapping("/usermanager")
@SessionAttributes(value = {Constants.CONDITION}, types = {BaseCondition.class})
public class UserManagerController extends BaseController
{
    @Resource
    private UserManagerService userManagerService;

    /**
     * 进入用户查询页面,清空session中的条件回显
     *
     * @return String
     */
    @RequestMapping(value = "/initUsermanagerPre")
    public String initUsermanagerPre(SessionStatus status) throws ActionException
    {
        status.setComplete();
        return "userManager/usermanager";
    }

    /**
     * 进入用户查询页面
     *
     * @return String
     */
    @RequestMapping(value = "/usermanagerPre")
    public String usermanagerPre() throws ActionException
    {

        return "userManager/usermanager";
    }

    /**
     * 用户信息查询所有
     *
     * @param condition
     * @param curPage
     * @return
     */
    @RequestMapping(value = "/userManagerPageQuery")
    public
    @ResponseBody
    com.sandrew.bury.bean.PageResult<UserPO> userManagerPageQuery(UserPO condition, int curPage) throws JsonException
    {
        try
        {
            return userManagerService.userManagerPageQuery(condition, curPage);
        }
        catch (Exception e)
        {
            throw new JsonException(e.getMessage(), e);
        }

    }

    /**
     * Function    : 进入创建用户
     * LastUpdate  : 2016年4月16日
     *
     * @return
     */
    @RequestMapping(value = "/createUserInfoPre")
    public String createUserInfoPre() throws ActionException
    {
        return "userManager/createUserInfo";
    }

    /**
     * Function    : 编辑用户信息
     * LastUpdate  : 2016年4月16日
     *
     * @return
     */
    @RequestMapping(value = "/updateUserInfoPre")
    public String updateUserInfoPre(Integer userId, Model model) throws ActionException
    {
        try
        {
            UserPO user = userManagerService.findByUserId(userId);
            model.addAttribute("userPO", user);
        }
        catch (ServiceException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "userManager/updateOfUser";
    }

    /**
     * 用户信息保存
     *
     * @param user
     * @param file
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/createUserInfo")
    public
    @ResponseBody
    AjaxResult createUserInfo(UserPO user, @RequestParam(value = "file", required = false) MultipartFile file) throws JsonException
    {
        try
        {
            if (file != null)
            {
                // 上传文件到文件服务器
                AbstractManager manager = new FTPManager();
                FileServer fileserver = new FileServer(manager);
                String filePath = fileserver.upload(file.getOriginalFilename(), ((FileInputStream) file.getInputStream()));
                user.setAvatar(filePath);
            }
            return userManagerService.createUserInfo(user, file, getLoginUser());
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new JsonException(e.getMessage(), e);
        }
    }

    /**
     * 用户信息编辑
     *
     * @param user
     * @param avatar
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/updateUserInfo")
    public
    @ResponseBody
    AjaxResult updateUserInfo(UserPO user, @RequestParam(value = "avatar", required = false) MultipartFile avatar) throws JsonException
    {
        try
        {
            return userManagerService.updateUserInfo(user, avatar, getLoginUser());
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new JsonException(e.getMessage(), e);
        }
    }

    /**
     * Function    : 删除用户
     * LastUpdate  : 2016年4月16日
     *
     * @param userId
     * @return
     * @throws ActionException
     */
    @RequestMapping(value = "/deleteUserInfo")
    public
    @ResponseBody
    AjaxResult deleteUserInfo(Integer userId) throws JsonException
    {
        try
        {
            return userManagerService.deleteUserInfo(userId, getLoginUser());
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new JsonException(e.getMessage(), e);
        }
    }


    /**
     * Function    : 跳转编辑个人信息页面
     * LastUpdate  : 2016年4月16日
     *
     * @return
     */
    @RequestMapping(value = "/profilePre")
    public String profilePre(Integer userId, Model model) throws JsonException
    {
        try
        {
            UserPO user = userManagerService.findByUserId(userId);
            model.addAttribute("userPO", user);
        }
        catch (ServiceException e)
        {
            e.printStackTrace();
            throw new JsonException(e.getMessage(), e);
        }
        return "userManager/updateProfile";
    }


    /**
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/updateProfile")
    public
    @ResponseBody
    AjaxResult updateProfile(UserPO user, @RequestParam(value = "file", required = false) MultipartFile file) throws JsonException
    {
        try
        {
            if (file == null && user.getAvatar() == null && "".equals(user.getAvatar()))
            {
                //如果页面没有照片信息，清空照片
                userManagerService.updateClearAvatar(user.getUserId(), getLoginUser());
            }
            else
            {
                if (file != null)
                {
                    // 上传文件到文件服务器
                    AbstractManager manager = new FTPManager();
                    FileServer fileserver = new FileServer(manager);
                    String filePath = fileserver.upload(file.getOriginalFilename(), ((FileInputStream) file.getInputStream()));
                    user.setAvatar(filePath);
                }
            }
            return userManagerService.updateUserInfo(user, file, getLoginUser());
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new JsonException(e.getMessage(), e);
        }
    }

    /**
     * Function    :
     * LastUpdate  : 2016年9月22日
     *
     * @param userId
     * @return
     * @throws JsonException
     */
    @RequestMapping(value = "/queryRelationRoles")
    public
    @ResponseBody
    List<RolePO> queryRelationRoles(Integer userId) throws JsonException
    {
        try
        {
            return userManagerService.getRelationRolesByUserId(userId);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new JsonException(e.getMessage(), e);
        }
    }


    @RequestMapping(value = "/deleteRoleRelation")
    public
    @ResponseBody
    AjaxResult deleteRoleRelation(Integer userId, Integer roleId) throws JsonException
    {
        try
        {
            return userManagerService.deleteRoleRelation(userId, roleId);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new JsonException(e.getMessage(), e);
        }
    }

    /**
     * Function    : 查询该userId全部未关联角色
     * LastUpdate  : 2016年9月22日
     *
     * @param userId
     * @param roleName
     * @return
     * @throws JsonException
     */
    @RequestMapping(value = "/queryUnRelationRoles")
    public
    @ResponseBody
    List<RolePO> queryUnRelationRoles(Integer userId, String roleName) throws JsonException
    {
        try
        {
            AclUserBean aclUser = new AclUserBean();
            aclUser.setUserId(userId);
            aclUser.setRoleName(roleName);
            return userManagerService.getUnRelationRoles(aclUser);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new JsonException(e.getMessage(), e);
        }
    }

    /**
     * Function    : 创建用户与角色关系
     * LastUpdate  : 2016年9月22日
     *
     * @param userId
     * @param rolesStr
     * @return
     * @throws JsonException
     */
    @RequestMapping(value = "/createRelation")
    public
    @ResponseBody
    AjaxResult createRelation(Integer userId, String rolesStr) throws JsonException
    {
        try
        {
            return userManagerService.createRelation(userId, rolesStr, getLoginUser());
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new JsonException(e.getMessage(), e);
        }
    }

    /**
     * Function : 查看头像 LastUpdate : 2016年10月8日
     *
     * @param avatarPath
     * @param response
     * @throws ActionException
     */
    @RequestMapping(value = "/showAvatar", method = RequestMethod.GET)
    public void showAvatar(String avatarPath, HttpServletResponse response) throws ActionException
    {
        OutputStream outputStream = null;
        try
        {
            // 文件服务器下载附件
            AbstractManager manager = new FTPManager();
            FileServer fileserver = new FileServer(manager);
            byte[] bytes = fileserver.download(avatarPath);
            outputStream = response.getOutputStream();
            response.setContentType("application/octet-stream;charset=UTF-8");
            FileCopyUtils.copy(bytes, outputStream);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new ActionException("查看头像失败", e);
        }
    }
}
