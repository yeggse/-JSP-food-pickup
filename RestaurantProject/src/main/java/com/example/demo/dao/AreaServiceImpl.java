package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.AreaMapper;
import com.example.demo.model.Area;

@Service //서비스임을 선언
public class AreaServiceImpl implements AreaService{

	@Autowired //Mapper와 연결
	private AreaMapper areaMapper;
	@Override
	public List<Area> selectDongList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return areaMapper.selectDongList(map);
	}
	@Override
	public List<Area> selectGuList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return areaMapper.selectGuList(map);
	}
	@Override
	public List<Area> selectSiList(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return areaMapper.selectSiList(map);
	}

		
}