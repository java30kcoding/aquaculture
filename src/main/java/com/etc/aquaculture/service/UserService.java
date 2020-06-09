package com.etc.aquaculture.service;

import com.etc.aquaculture.common.R;
import com.etc.aquaculture.dao.UserRepository;
import com.etc.aquaculture.pojo.User;
import com.etc.aquaculture.utils.Md5Utils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author yuanyl
 * @date 2020/6/8 16:42
 **/
@Service
public class UserService {

    @Resource
    UserRepository userRepository;

    public R register(User user){
        if (StringUtils.isEmpty(user.getUsername())) {
            return R.fail("用户名不能为空");
        } else if (StringUtils.isEmpty(user.getPassword())) {
            return R.fail("密码不能为空");
        } else {
            //Md5加密用户密码
            user.setPassword(Md5Utils.encode(user.getPassword()));
            userRepository.save(user);
            return R.success();
        }
    }

    public User login(User user){
        User byUserNameAndUserPassword = userRepository.
                findByUsernameAndPassword(user.getUsername(), Md5Utils.encode(user.getPassword()));
        if (byUserNameAndUserPassword != null) {
            return byUserNameAndUserPassword;
        } else {
            return null;
        }
    }

}
