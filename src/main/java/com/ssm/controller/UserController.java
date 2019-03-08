package com.ssm.controller;

import java.util.Date;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.mapper.UserMapper;
import com.ssm.pojo.User;
import com.ssm.pojo.Role;
import com.ssm.service.UserService;
import com.ssm.util.Constants;
import com.ssm.util.Page;

@Controller
@RequestMapping("/user")
public class UserController {
	private Logger logger = Logger.getLogger(UserController.class);
	@Resource
	private UserService userService;

	/**
	 * 测试ModelAndView
	 */
	@RequestMapping("/index")
	public ModelAndView index(String username) {
		ModelAndView mView = new ModelAndView();
		mView.addObject("username", username);
		mView.setViewName("login");
		return mView;

	}

	/**
	 * 测试Model
	 */
	@RequestMapping("/index2")
	public String index1(String username, Model model) {
		model.addAttribute("username", username);
		User user = new User();
		user.setUserName(username);
		model.addAttribute("user", user);
		return "login";
	}

	@RequestMapping(value = "/login")
	public String login() {
		logger.debug("UserController welcome SMBMS==================");
		return "login";
	}

	/**
	 * 登录验证
	 */
	@RequestMapping("/dologin")
	public String dologin(@RequestParam String userCode, @RequestParam String userPassword, HttpServletRequest request,
			HttpSession session, Model model) {
		User user = userService.login(userCode, userPassword);
		System.err.println(user);
		if (user != null) {
			// 放入session
			session.setAttribute(Constants.USER_SESSION, user);
			System.out.println("-------------------->"+user.getId());
			model.addAttribute("user", user);
			return "redirect:/user/main.do";
		} else {
			// 页面跳转(login.jsp)带出提示信息---转发
			request.setAttribute("error", "用户名或密码不正确");
			return "login";
		}
	}

	@RequestMapping("/main")
	public String main(HttpSession session) {
		if (session.getAttribute(Constants.USER_SESSION) == null) {
			return "redirect:/user/login.do";
		}
		return "frame";
	}

	/**
	 * 查询所有用户
	 */
	@RequestMapping("/findall")
	public String findall(ModelMap map, Page page) {
		userService.findAll(page);
		map.put("page", page);
		return "userlist";
	}

	/**
	 * 根据id查看
	 */
	@RequestMapping("/finduser")
	public String finduser(Integer id, Model model) {
		User user = userService.get(id);
		model.addAttribute("user", user);
		return "userview";
	}

	/**
	 * 跳转添加用户yemian
	 */
	@RequestMapping("/toUserAdd")
	public String toUserAdd() {
		return "useradd";
	}

	/**
	 * 添加用户数据
	 */
	@RequestMapping("/AddUser")
	public String AddUser(User user,MultipartFile idPic,HttpServletRequest request) {
		System.out.println("------------------->添加");
		if(idPic!=null) {
			String path=request.getServletContext().getRealPath("/images/upload");
			String oldName=idPic.getOriginalFilename();//源文件名
			String prefix=oldName.substring(oldName.lastIndexOf("."));
			String newName=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+prefix;
			File file=new File(path,newName);
			try {
				idPic.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			//得到文件路径
			String idPicPath="/images/upload/"+newName;
			System.out.println("idPicPath"+idPicPath);
			user.setIdPicPath(idPicPath);
		}
		System.out.println("------------------->添加");
		int i = userService.add(user);
		if (i > 0) {
			System.out.println("添加数据成功!");
			return "redirect:/user/getuserlist.do";
		}
		return "redirect:/user/getuserlist.do";
	}

	/**
	 * 根据id删除用户
	 */
	@RequestMapping("/deluser")
	public String deluser(Integer id, Model model) {
		int userList = userService.del(id);
		model.addAttribute("userList", userList);
		return "redirect:/user/getuserlist.do";
	}

	/**
	 * 根据id查看用户
	 */
	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id, Model model) {
		User user = userService.get(id);
		model.addAttribute("user", user);
		return "usermodify";
	}

	/**
	 * 模糊查询
	 *//*
		 * @RequestMapping("/findlist") public String findlist(String queryname, String
		 * queryUserRole, Model model,@RequestParam(name="pn",defaultValue="1")Integer
		 * pn) { List<User> list = userService.findlist(queryname, queryUserRole);
		 * PageHelper.startPage(pn, 6); PageInfo<User> info = new
		 * PageInfo<User>(list,6); model.addAttribute("userList", info); return
		 * "userlist"; }
		 */
	/**
	 * 模糊查询
	 *//*
		 * @RequestMapping("/like") public String like() { return "userlist"; }
		 */
	/**
	 * 查询所有用户数据
	 *//*
		 * @RequestMapping("/findUserAll") public String findUserAll(Model model) {
		 * List<User>userList=userService.findUserAll(); model.addAttribute("userList",
		 * userList); return"userlist"; }
		 */

	/**
	 * 根据id查询用户信息
	 */
	@RequestMapping("/findiduser")
	public String findiduser(Integer id, Model model) {
		User user = userService.get(id);
		model.addAttribute("user", user);
		return "usermodify";
	}

	/**
	 * 修改用户信息
	 */
	@RequestMapping("/userupdate")
	public String userupdate(Integer id, User user, Model model) {
		int userList = userService.update(user);
		if (userList > 0) {
            model.addAttribute("modify", "ok");
        } else {
            model.addAttribute("modify", "no");
        }
		model.addAttribute("userList", userList);
		return "redirect:/user/getuserlist.do";
	}

	/**
	 * 跳转修改密码页面
	 */
	@RequestMapping("/rpassword")
	public String rpassword() {
		return "pwdmodify";
	}

	/**
	 * 异常处理
	 */
	@RequestMapping("/exlogin")
	public String exLogin(@RequestParam String userCode, @RequestParam String userPassWord) {
		User user = userService.login(userCode, userPassWord);
		if (user == null) {
			throw new RuntimeException("用户名或者密码不正确!");
		}
		return "redirect:/user/main.do";
	}

	@ExceptionHandler(value = { RuntimeException.class })
	public String handlerException(RuntimeException e, HttpServletRequest req) {
		req.setAttribute("e", e);
		return "redirect:/user/error.do";
	}

	/**
	 * 跳转错误页面
	 */
	@RequestMapping("/error")
	public String error() {
		return "error";
	}

	/**
	 * 查询所有用户
	 */
	@RequestMapping("/finfUserlist")
	public String findUserlist(Model model) {
		List<User> userList = userService.findUserAll();
		model.addAttribute("userList", userList);
		return "userlist";
	}

	@RequestMapping("/toMainPage")
	public String toMainPage() {
		return "main";
	}

	@RequestMapping("fen")
	public String fen() {
		return "lianxing";
	}

	/**
	 * 查询所有用户
	 */
	@RequestMapping("/finfUserlist2")
	public String findUserlist2(ModelMap model, @RequestParam(name = "pn", defaultValue = "1") Integer pn) {
		// 调用当前页
		PageHelper.startPage(pn, 5);
		List<User> list = userService.findUserAll();
		PageInfo<User> info = new PageInfo<User>(list, 5);
		model.put("userList", info);
		return "list";
	}

	@RequestMapping("/userlist")
	public String userlist() {
		return "userlist";
	}

	/**
	 * 查询所有用户
	 */
	@RequestMapping("/finfUserlist3")
	public String findUserlist3(ModelMap model, @RequestParam(name = "pn", defaultValue = "1") Integer pn) {
		// 调用当前页
		PageHelper.startPage(pn, 8);
		List<User> list = userService.findUserAll();
		PageInfo<User> info = new PageInfo<User>(list, 8);
		model.put("userList", info);
		return "userlist";
	}

	/**
	 * 注销
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/login.jsp";

	}

	/**
	 * 跳转页面
	 */
	@RequestMapping("/u")
	public String u() {
		return "u";
	}

	/**
	 * 分页
	 */
	@RequestMapping("/getuserlist")
	public String getuserlist(Model model, @RequestParam(value = "queryname", required = false) String querynamess,
			@RequestParam(value = "queryUserRole", required = false) String queryUserRoless,
			@RequestParam(value = "pageIndex", required = false) String pageIndex) {

		List<User> userList = null;
		int cuurrentPageNo = 0;
		int indexs = 1;
		if (pageIndex != null && pageIndex != "") {
			indexs = Integer.parseInt(pageIndex);
		}
		cuurrentPageNo = (indexs - 1) * 8;
		String queryname = null;
		int queryUserRole = 0;
		if (querynamess != null && querynamess != "") {
			queryname = querynamess;
		}
		if (queryUserRoless != null && queryUserRoless != "") {
			queryUserRole = Integer.parseInt(queryUserRoless);
		}
		int tatalCount = userService.selectCount(queryname, queryUserRole);
		int pageCount = tatalCount % 8 == 0 ? tatalCount / 8 : (tatalCount / 8) + 1;
		userList = userService.getUserList(queryUserRole, queryname, cuurrentPageNo);
		model.addAttribute("userList", userList);
		List<Role> roleList = userService.getRoleList();
		model.addAttribute("roleList", roleList);
		model.addAttribute("querUserName", queryname);
		model.addAttribute("querUserRole", queryUserRole);
		model.addAttribute("totalCount", tatalCount);
		model.addAttribute("index", indexs);
		model.addAttribute("pageCount", pageCount);
		System.out.println("userList" + userList.size() + "====>tatolCount:" + tatalCount + "====>cuurrentPageNo:"
				+ cuurrentPageNo);
		return "userlist";
	}
	/**
	 *验证用户编码唯一性
	 *
	 */
	@RequestMapping("check")
	public @ResponseBody Map existsUserCode(String userCode) {
		boolean bl = userService.existsUserCode(userCode);
		Map map = new HashMap();
		map.put("isExists", bl);
		return map;
	}
	
	/**
	 * 验证用户姓名唯一性
	 */
	@RequestMapping("checkName")
	public @ResponseBody Map existsUserName(String userName) {
		Boolean b1=userService.existsUserName(userName);
		Map map=new HashMap();
		map.put("isExists", b1);
		return map;
	}
	
	/**
	 * 密码修改
	 */
	@RequestMapping("updatepwd")
	@ResponseBody
	public Object updatepwd(String oldpassword,@RequestParam("id")String id) {
		boolean b=userService.findpwd(oldpassword, id);
		Map map=new HashMap();
		map.put("result", b);
		return map;
	}
	/**
	 * 修改密码
	 */
	@RequestMapping("toupdatepwd")
	public String toupdatepwd(String newpassword,String id) {
		User user=new User();
		user.setUserPassword(newpassword);
		user.setId(Integer.parseInt(id));;
		int i=userService.updatepwd(user);
		return"redirect:/user/rpassword.do";
	}
}