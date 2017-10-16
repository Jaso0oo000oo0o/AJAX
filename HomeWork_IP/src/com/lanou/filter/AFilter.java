package com.lanou.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.Map;

/**
 * 从 application 中获取 map
 * 从 request 当中获取 ip, 进行统计.
 * 结果保存到 map
 */
@WebFilter(filterName = "AFilter")
public class AFilter implements Filter {
    private FilterConfig config;
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        /*
		 * 1. 得到application中的map
		 * 2. 从request中获取当前客户端的ip地址
		 * 3. 查看map中是否存在这个ip对应访问次数，如果存在，把次数+1再保存回去
		 * 4. 如果不存在这个ip，那么说明是第一次访问本站，设置访问次数为1
		 */
		/*
		 * 1. 得到appliction
		 */
        ServletContext app = config.getServletContext();
        Map<String,Integer> map = (Map<String, Integer>) app.getAttribute("map");
		/*
		 * 2. 获取客户端的ip地址
		 */
        String ip = req.getRemoteAddr();
		/*
		 * 3. 进行判断
		 */
        if(map.containsKey(ip)) {//这个ip在map中存在，说明不是第一次访问
            int cnt = map.get(ip);
            map.put(ip, cnt+1);
        } else {//这个ip在map中不存在，说明是第一次访问
            map.put(ip, 1);
        }
        app.setAttribute("map", map);//把map再放回到app中
        chain.doFilter(req, resp);//肯定放行
    }

    public void init(FilterConfig config) throws ServletException {
    this.config = config;
    }

}
