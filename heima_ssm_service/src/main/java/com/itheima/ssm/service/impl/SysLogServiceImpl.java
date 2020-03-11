package com.itheima.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.ssm.dao.ISysLogDao;
import com.itheima.ssm.domain.SysLog;
import com.itheima.ssm.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {

    @Autowired
    private ISysLogDao sysLogDao;

    @Override
    public List<SysLog> findAll(Integer page, Integer size) throws Exception {
        //参数pageNum 是页码值   参数pageSize 代表是每页显示条数
        PageHelper.startPage(page, size);
        return sysLogDao.findAll();
    }

//    @Override
//    public List<SysLog> findAll() throws Exception {
//        return sysLogDao.findAll();
//    }
//

    @Override
    public void save(SysLog sysLog) throws Exception {
        System.out.println(sysLog.toString());
        sysLogDao.save(sysLog);
    }
}
