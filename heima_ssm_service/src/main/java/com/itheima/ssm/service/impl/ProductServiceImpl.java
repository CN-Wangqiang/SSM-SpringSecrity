package com.itheima.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.ssm.dao.IProductDao;
import com.itheima.ssm.domain.Product;
import com.itheima.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ProductServiceImpl implements IProductService{

    @Autowired
    private IProductDao productDao;

    @Override
    public void save(Product product) {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        product.setId(uuid);
        productDao.save(product);
    }

    @Override
    public List<Product> findAll(Integer page, Integer size) throws Exception{
        //参数pageNum 是页码值   参数pageSize 代表是每页显示条数
        PageHelper.startPage(page, size);
        return productDao.findAll();
    }
}
