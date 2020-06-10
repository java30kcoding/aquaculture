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
