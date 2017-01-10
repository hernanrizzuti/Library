package com.fdm.controller.filter;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;

public class ImageFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String url = req.getRequestURI();
		String imageurl = URLDecoder.decode(url.substring(url.lastIndexOf("/")+1), "UTF-8");
		File file = new File("/Library/apache-tomcat-7.0.57/uploads/Library/imgs/",imageurl);
		//File file = new File("/var/lib/tomcat8/uploads/Library/imgs/",imageurl);
		resp.setHeader("Content-Type", req.getSession().getServletContext().getMimeType(imageurl));
		resp.setHeader("Content-Length", String.valueOf(file.length()));
		resp.setHeader("Content-Disposition", "inline; filename=\"" + imageurl + "\"");
		FileUtils.copyFile(file, resp.getOutputStream());
	}

	@Override
	public void destroy() {

	}

}
