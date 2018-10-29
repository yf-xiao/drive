package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.ApplysDAO;
import com.dao.ArticleDAO;
import com.dao.DetailsDAO;
import com.dao.DriversDAO;
import com.dao.GrievanceDAO;
import com.dao.OrdersDAO;
import com.dao.PayDAO;
import com.dao.TopicDAO;
import com.dao.UsersDAO;
import com.entity.Applys;
import com.entity.Article;
import com.entity.Details;
import com.entity.Drivers;
import com.entity.Grievance;
import com.entity.Orders;
import com.entity.Pay;
import com.entity.Topic;
import com.entity.Users;
import com.mysql.jdbc.Driver;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping("/index")
public class IndexAction extends BaseAction {
    @Autowired
    private ArticleDAO articleDAO;
    @Autowired
    private UsersDAO usersDAO;
    @Autowired
    private TopicDAO topicDAO;
    @Autowired
    private DetailsDAO detailsDAO;
    @Autowired
    private DriversDAO driversDAO;
    @Autowired
    private OrdersDAO ordersDAO;
    @Autowired
    private PayDAO payDAO;
    @Autowired
    private ApplysDAO applysDAO;
    @Autowired
    private GrievanceDAO grievanceDAO;
    

    // 公共方法 提供公共查询数据
    private void front() {
        this.getSession().setAttribute("haveOrder", "1");
        getRequest().setAttribute("title", "Driver After Drinking");
        List<Drivers> recommendList = this.driversDAO.getDriversByRecommend();
        this.getRequest().setAttribute("recommendList", recommendList);
    }

    // 首页显示
    @RequestMapping("index.action")
    public String index() {
        System.out.println("test");
        this.front();
        List<Article> articleList = this.articleDAO.getFrontArticle();
        this.getRequest().setAttribute("articleList", articleList);
        List<Drivers> frontList = this.driversDAO.getDriversByFront();
        this.getRequest().setAttribute("frontList", frontList);
        return "users/index";
    }

    // 全部查询
    @RequestMapping("all.action")
    public String all(String cond, String name, String number, Map<String, Object> map) {
        this.front();
        List<Drivers> driversList = new ArrayList<Drivers>();
        List<Drivers> tempList = new ArrayList<Drivers>();
        Drivers drivers = new Drivers();
        if (cond != null) {
            if ("realname".equals(cond)) {
                drivers.setRealname(name);
                tempList = this.driversDAO.getDriversByLike(drivers);
            }
            if ("sex".equals(cond)) {
                drivers.setSex(name);
                tempList = this.driversDAO.getDriversByLike(drivers);
            }
            if ("idcard".equals(cond)) {
                drivers.setIdcard(name);
                tempList = this.driversDAO.getDriversByLike(drivers);
            }
            if ("contact".equals(cond)) {
                drivers.setContact(name);
                tempList = this.driversDAO.getDriversByLike(drivers);
            }
            if ("num".equals(cond)) {
                drivers.setNum(Integer.parseInt(name));
                tempList = this.driversDAO.getDriversByLike(drivers);
            }
        }else{
            tempList = this.driversDAO.getAllDriversNoS();
        }
        int pageNumber = tempList.size();
        int maxPage = pageNumber;
        if (maxPage % 8 == 0) {
            maxPage = maxPage / 8;
        } else {
            maxPage = maxPage / 8 + 1;
        }
        if (number == null) {
            number = "0";
        }
        int start = Integer.parseInt(number) * 8;
        int over = (Integer.parseInt(number) + 1) * 8;
        int count = pageNumber - over;
        if (count <= 0) {
            over = pageNumber;
        }
        for (int i = start; i < over; i++) {
            Drivers drivers1 = tempList.get(i);
            driversList.add(drivers1);
        }
        String html = "";
        StringBuffer buffer = new StringBuffer();
        buffer.append("&nbsp;&nbsp;共为");
        buffer.append(maxPage);
        buffer.append("页&nbsp; 共有");
        buffer.append(pageNumber);
        buffer.append("条&nbsp; 当前为第");
        buffer.append((Integer.parseInt(number) + 1));
        buffer.append("页 &nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("首页");
        } else {
            buffer.append("<a href=\"index/all.action?number=0&&cond="+ cond +"&&name="+ name +"\">首页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("上一页");
        } else {
            buffer.append("<a href=\"index/all.action?number=" + (Integer.parseInt(number) - 1) + "&&cond="+ cond +"&&name="+ name +"\">上一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("下一页");
        } else {
            buffer.append("<a href=\"index/all.action?number=" + (Integer.parseInt(number) + 1) + "&&cond="+ cond +"&&name="+ name +"\">下一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("尾页");
        } else {
            buffer.append("<a href=\"index/all.action?number=" + (maxPage - 1) + "&&cond="+ cond +"&&name="+ name +"\">尾页</a>");
        }
        html = buffer.toString();
        map.put("html", html);
        map.put("cond", cond);
        map.put("name", name);
        map.put("driversList", driversList);
        return "users/list";
    }

    // 详细
    @RequestMapping("detail.action")
    public String detail(String id, String number, Map<String, Object> map) {
        this.front();
        Drivers dr = this.driversDAO.getDriversById(id);
        this.getRequest().setAttribute("drivers", dr);
        Topic topic1 = new Topic();
        topic1.setDriversid(id);
        
        List<Topic> topicList = new ArrayList<Topic>();
        List<Topic> tempList = new ArrayList<Topic>();
        tempList = this.topicDAO.getTopicByCond(topic1);
        
        int pageNumber = tempList.size();
        int maxPage = pageNumber;
        if (maxPage % 10 == 0) {
            maxPage = maxPage / 10;
        } else {
            maxPage = maxPage / 10 + 1;
        }
        if (number == null) {
            number = "0";
        }
        int start = Integer.parseInt(number) * 10;
        int over = (Integer.parseInt(number) + 1) * 10;
        int count = pageNumber - over;
        if (count <= 0) {
            over = pageNumber;
        }
        for (int i = start; i < over; i++) {
            Topic topic = tempList.get(i);
            topicList.add(topic);
        }
        String html = "";
        StringBuffer buffer = new StringBuffer();
        buffer.append("&nbsp;&nbsp;共为");
        buffer.append(maxPage);
        buffer.append("页&nbsp; 共有");
        buffer.append(pageNumber);
        buffer.append("条&nbsp; 当前为第");
        buffer.append((Integer.parseInt(number) + 1));
        buffer.append("页 &nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("首页");
        } else {
            buffer.append("<a href=\"index/detail.action?number=0&&id="+id+"\">首页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("上一页");
        } else {
            buffer.append("<a href=\"index/detail.action?number=" + (Integer.parseInt(number) - 1) +"&&id="+id+"\">上一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("下一页");
        } else {
            buffer.append("<a href=\"index/detail.action?number=" + (Integer.parseInt(number) + 1) +"&&id="+id+"\">下一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("尾页");
        } else {
            buffer.append("<a href=\"index/detail.action?number=" + (maxPage - 1) +"&&id="+id+"\">尾页</a>");
        }
        html = buffer.toString();
        map.put("html", html);
        map.put("topicList", topicList);
        
        
        int count1 = 0;
        List<Orders> list = this.ordersDAO.getOrdersByDriversId(dr.getDriversid());
        
        if(list.size()!=0){
            for(int i=0;i<list.size();i++){
                if(list.get(i).getStatus().equals("未接单") || list.get(i).getStatus().equals("服务中") || list.get(i).getStatus().equals("付款中") || list.get(i).getStatus().equals("已接单")){
                }else{
                    count1++;
                }    
            }
            map.put("count", count1);
        }
        return "users/detail";
    }

    @RequestMapping("addTopic.action")
    public String addTopic(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        Topic topic = new Topic();
        topic.setTopicid(VeDate.getStringDatex());
        topic.setAddtime(VeDate.getStringDateShort());
        topic.setContents(this.getRequest().getParameter("contents"));
        topic.setDriversid(id);
        topic.setNum(Integer.parseInt(this.getRequest().getParameter("num")));
        topic.setUsersid(userid);
        this.topicDAO.insertTopic(topic);

        return "redirect:/index/detail.action?id=" + topic.getDriversid();
    }

    // 新闻公告
    @RequestMapping("article.action")
    public String article(String cond, String name, String number, Map<String, Object> map) {
        this.front();
        List<Article> articleList = new ArrayList<Article>();
        List<Article> tempList = new ArrayList<Article>();
        Article article1 = new Article();
        if (cond != null) {
            if ("title".equals(cond)) {
                article1.setTitle(name);
                tempList = this.articleDAO.getArticleByLike(article1);
            }
            if ("image".equals(cond)) {
                article1.setImage(name);
                tempList = this.articleDAO.getArticleByLike(article1);
            }
            if ("contents".equals(cond)) {
                article1.setContents(name);
                tempList = this.articleDAO.getArticleByLike(article1);
            }
            if ("addtime".equals(cond)) {
                article1.setAddtime(name);
                tempList = this.articleDAO.getArticleByLike(article1);
            }
            if ("hits".equals(cond)) {
                article1.setHits(name);
                tempList = this.articleDAO.getArticleByLike(article1);
            }
        }else{
            tempList = this.articleDAO.getAllArticle();
        }
        int pageNumber = tempList.size();
        int maxPage = pageNumber;
        if (maxPage % 10 == 0) {
            maxPage = maxPage / 10;
        } else {
            maxPage = maxPage / 10 + 1;
        }
        if (number == null) {
            number = "0";
        }
        int start = Integer.parseInt(number) * 10;
        int over = (Integer.parseInt(number) + 1) * 10;
        int count = pageNumber - over;
        if (count <= 0) {
            over = pageNumber;
        }
        for (int i = start; i < over; i++) {
            Article article = tempList.get(i);
            articleList.add(article);
        }
        String html = "";
        StringBuffer buffer = new StringBuffer();
        buffer.append("&nbsp;&nbsp;共为");
        buffer.append(maxPage);
        buffer.append("页&nbsp; 共有");
        buffer.append(pageNumber);
        buffer.append("条&nbsp; 当前为第");
        buffer.append((Integer.parseInt(number) + 1));
        buffer.append("页 &nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("首页");
        } else {
            buffer.append("<a href=\"index/article.action?number=0&&cond="+ cond +"&&name="+ name +"\">首页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("上一页");
        } else {
            buffer.append("<a href=\"index/article.action?number=" + (Integer.parseInt(number) - 1) + "&&cond="+ cond +"&&name="+ name +"\">上一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("下一页");
        } else {
            buffer.append("<a href=\"index/article.action?number=" + (Integer.parseInt(number) + 1) + "&&cond="+ cond +"&&name="+ name +"\">下一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("尾页");
        } else {
            buffer.append("<a href=\"index/article.action?number=" + (maxPage - 1) + "&&cond="+ cond +"&&name="+ name +"\">尾页</a>");
        }
        html = buffer.toString();
        map.put("html", html);
        map.put("cond", cond);
        map.put("name", name);
        map.put("articleList", articleList);
        return "users/article";
    }

    // 阅读公告
    @RequestMapping("read.action")
    public String read(String id) {
        this.front();
        Article article = this.articleDAO.getArticleById(id);
        article.setHits("" + (Integer.parseInt(article.getHits()) + 1));
        this.articleDAO.updateArticle(article);
        this.getRequest().setAttribute("article", article);
        return "users/read";
    }

    // 准备登录
    @RequestMapping("preLogin.action")
    public String prelogin() {
        this.front();
        return "users/login";
    }

    // 用户登录
    @RequestMapping("login.action")
    public String login() {
        this.front();
        String username = this.getRequest().getParameter("username");
        String password = this.getRequest().getParameter("password");
        String status = this.getRequest().getParameter("status");
        Users u = new Users();
        u.setUsername(username);
        Map<String, String> map = new HashMap<String, String>();
        if (status.equals("用户")) {
            List<Users> usersList = this.usersDAO.getUsersByCond(u);
            if (usersList.size() == 0) {
                this.getSession().setAttribute("loginmsg", "用户名不存在");
                return "redirect:/index/preLogin.action";
            } else {
                Users users = usersList.get(0);
                if (password.equals(users.getPassword())) {
                    this.getSession().setAttribute("userid", users.getUsersid());
                    this.getSession().setAttribute("username", users.getUsername());
                    this.getSession().setAttribute("users", users);
                    return "redirect:/index/usercenter.action";
                } else {
                    this.getSession().setAttribute("loginmsg", "密码错误");
                    return "redirect:/index/preLogin.action";
                }
            }
        } else {
            Drivers dr = new Drivers();
            dr.setUsername(username);
            List<Drivers> dList = this.driversDAO.getDriversByCond(dr);
            if (dList.size() == 0) {
                this.getSession().setAttribute("loginmsg", "用户名不存在");
                return "redirect:/index/preLogin.action";
            } else {
                Drivers d = dList.get(0);
                if (d.getStatus().equals("锁定")) {
                    this.getSession().setAttribute("loginmsg", "司机审核中,请稍等或联系管理员");
                    return "redirect:/index/preLogin.action";
                }
                if (password.equals(d.getPassword())) {
                    this.getSession().setAttribute("userid", d.getDriversid());
                    this.getSession().setAttribute("username", d.getUsername());
                    this.getSession().setAttribute("users", d);
                    this.getSession().setAttribute("driversid", d.getDriversid());
                    return "redirect:/index/dusercenter.action";
                } else {
                    this.getSession().setAttribute("loginmsg", "密码错误");
                    return "redirect:/index/preLogin.action";
                }
            }
        }

    }
    
    // 准备注册
    @RequestMapping("preReg.action")
    public String preReg() {
        this.front();
        return "users/register";
    }

    // 用户注册
    @RequestMapping("register.action")
    public String register(Users users) {
        this.front();
        users.setUsersid("" + VeDate.getStringDatex());
        users.setRegdate(VeDate.getStringDateShort());
        users.setSex("先生");
        users.setImage("upfiles/20180330160936.png");
        this.usersDAO.insertUsers(users);
        return "redirect:/index/preLogin.action";
    }

    // 准备注册
    @RequestMapping("preDReg.action")
    public String preDReg() {
        this.front();
        return "users/dregister";
    }

    // 用户注册
    @RequestMapping("dregister.action")
    public String dregister(Drivers users) {
        this.front();
        users.setDriversid(VeDate.getStringDatex());
        users.setRegdate(VeDate.getStringDateShort());
        users.setImage("upfiles/20180330150112.jpg");
        users.setNum(0);
        users.setMoney(0);
        users.setStatus("锁定");
        this.driversDAO.insertDrivers(users);
        return "redirect:/index/preLogin.action";
    }

    // 退出登录
    @RequestMapping("exit.action")
    public String exit() {
        this.front();
        this.getSession().removeAttribute("userid");
        this.getSession().removeAttribute("username");
        this.getSession().removeAttribute("users");
        return "index";
    }

    // 用户中心
    @RequestMapping("usercenter.action")
    public String usercenter() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        Users u = this.usersDAO.getUsersById(userid);
        this.getSession().setAttribute("users", u);
        return "users/usercenter";
    }

    // 用户中心
    @RequestMapping("personal.action")
    public String personal(Users users) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        this.usersDAO.updateUsers(users);
        this.getSession().setAttribute("users", users);
        return "redirect:/index/usercenter.action";
    }

    // 司机用户中心
    @RequestMapping("dusercenter.action")
    public String dusercenter() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        Drivers u = this.driversDAO.getDriversById(userid);
        this.getSession().setAttribute("users", u);
        return "users/dusercenter";
    }

    // 司机用户中心
    @RequestMapping("dpersonal.action")
    public String dpersonal(Drivers users) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        this.driversDAO.updateDrivers(users);
        this.getSession().setAttribute("users", users);
        return "redirect:/index/dusercenter.action";
    }

    // 准备修改密码
    @RequestMapping("prePwd.action")
    public String prePwd() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        return "users/editpwd";
    }

    // 修改密码
    @RequestMapping("editpwd.action")
    public String editpwd() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        String password = this.getRequest().getParameter("password");
        String repassword = this.getRequest().getParameter("repassword");
        Users users = this.usersDAO.getUsersById(userid);
        if (password.equals(users.getPassword())) {
            users.setPassword(repassword);
            this.usersDAO.updateUsers(users);
        } else {
            this.getSession().setAttribute("msg", "原密码错误");
            this.getSession().setAttribute("tt", "a");
            return "redirect:/index/prePwd.action";
        }
        return "redirect:/index/prePwd.action";
    }

    // 准备修改司机密码
    @RequestMapping("preDPwd.action")
    public String preDPwd() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        return "users/editdpwd";
    }

    // 修改司机密码
    @RequestMapping("editDpwd.action")
    public String editDpwd() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        String password = this.getRequest().getParameter("password");
        String repassword = this.getRequest().getParameter("repassword");
        Drivers users = this.driversDAO.getDriversById(userid);
        if (password.equals(users.getPassword())) {
            users.setPassword(repassword);
            this.driversDAO.updateDrivers(users);
        } else {
            this.getSession().setAttribute("msg", "旧密码错误");
            return "redirect:/index/preDPwd.action";
        }
        return "redirect:/index/preDPwd.action";
    }

    // 准备发布订单
    @RequestMapping("preOrder.action")
    public String preOrder() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        return "users/addorder";
    }

    // 发布订单
    @RequestMapping("addOrder.action")
    public String addOrder(Orders orders) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        orders.setAddtime(VeDate.getStringDate());
        orders.setMoney(0);
        orders.setOrdercode("DO" + VeDate.getStringDatex());
        orders.setStatus("未接单");
        orders.setUsersid(userid);
        orders.setOrdersid(VeDate.getStringDatex());
        this.ordersDAO.insertOrders(orders);
        return "redirect:/index/myOrder.action";
    }

    // 我的订单
    @RequestMapping("myOrder.action")
    public String myOrder(String number) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        Orders orders = new Orders();
        orders.setUsersid(userid);
        orders.setDelstatus(1);
        List<Orders> ordersList = new ArrayList<Orders>();
        List<Orders> tempList = new ArrayList<Orders>();
        tempList = this.ordersDAO.getOrdersByCond(orders);
        int pageNumber = tempList.size();
        int maxPage = pageNumber;
        if (maxPage % 10 == 0) {
            maxPage = maxPage / 10;
        } else {
            maxPage = maxPage / 10 + 1;
        }
        if (number == null) {
            number = "0";
        }
        int start = Integer.parseInt(number) * 10;
        int over = (Integer.parseInt(number) + 1) * 10;
        int count = pageNumber - over;
        if (count <= 0) {
            over = pageNumber;
        }
        for (int i = start; i < over; i++) {
            Orders o = tempList.get(i);
            ordersList.add(o);
        }
        String html = "";
        StringBuffer buffer = new StringBuffer();
        buffer.append("&nbsp;&nbsp;共为");
        buffer.append(maxPage);
        buffer.append("页&nbsp; 共有");
        buffer.append(pageNumber);
        buffer.append("条&nbsp; 当前为第");
        buffer.append((Integer.parseInt(number) + 1));
        buffer.append("页 &nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("首页");
        } else {
            buffer.append("<a href=\"index/myOrder.action?number=0\">首页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("上一页");
        } else {
            buffer.append("<a href=\"index/myOrder.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("下一页");
        } else {
            buffer.append("<a href=\"index/myOrder.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("尾页");
        } else {
            buffer.append("<a href=\"index/myOrder.action?number=" + (maxPage - 1) + "\">尾页</a>");
        }
        html = buffer.toString();
        this.getRequest().setAttribute("ordersList", ordersList);
        this.getRequest().setAttribute("html", html);
        return "users/myorder";
    }

    // 用户删除订单
    @RequestMapping("cancel.action")
    public String cancel(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = this.ordersDAO.getOrdersById(id);
        orders.setDelstatus(1);
        this.ordersDAO.updateOrders(orders);
        return "redirect:/index/myOrder.action";
    }

    // 司机删除订单
    @RequestMapping("drivCcancel.action")
    public String drivCcancel(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = this.ordersDAO.getOrdersById(id);
        orders.setDelstatus(2);
        this.ordersDAO.updateOrders(orders);
        return "redirect:/index/dorders.action";
    }
        
    // 准备订单投诉
    @RequestMapping("preGrievance.action")
    public String preGrievance(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        this.getRequest().setAttribute("id", id);
        return "users/addGrievance";
    }

    // 订单投诉
    @RequestMapping("addGrievance.action")
    public String addGrievance(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        Orders orders = this.ordersDAO.getOrdersById(id);
        orders.setStatus("已投诉");
        this.ordersDAO.updateOrders(orders);
        Details details = new Details();
        details.setOrdercode(orders.getOrdercode());
        List<Details> dList = this.detailsDAO.getDetailsByCond(details);
        String drivername = "";
        if (dList.size() != 0) {
            String driverid = dList.get(0).getDriversid();
            Drivers d = this.driversDAO.getDriversById(driverid);
            drivername = d.getRealname();
            Grievance grievance = new Grievance();
            grievance.setAddtime(VeDate.getStringDateShort());
            grievance.setContents(this.getRequest().getParameter("contents"));
            grievance.setGrievanceid(VeDate.getStringDatex());
            grievance.setOrdercode(orders.getOrdercode());
            grievance.setUsersid(userid);
            grievance.setDrivername(drivername);
            this.grievanceDAO.insertGrievance(grievance);
        }
        return "redirect:/index/myGrievance.action";
    }
    
    // 我的订单投诉
    @RequestMapping("myGrievance.action")
    public String myGrievance(String number) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        Grievance grievance = new Grievance();
        grievance.setUsersid(userid);
        List<Grievance> grievanceList = new ArrayList<Grievance>();
        List<Grievance> tempList = new ArrayList<Grievance>();
        tempList = this.grievanceDAO.getGrievanceByCond(grievance);
        int pageNumber = tempList.size();
        int maxPage = pageNumber;
        if (maxPage % 10 == 0) {
            maxPage = maxPage / 10;
        } else {
            maxPage = maxPage / 10 + 1;
        }
        if (number == null) {
            number = "0";
        }
        int start = Integer.parseInt(number) * 10;
        int over = (Integer.parseInt(number) + 1) * 10;
        int count = pageNumber - over;
        if (count <= 0) {
            over = pageNumber;
        }
        for (int i = start; i < over; i++) {
            Grievance g = tempList.get(i);
            grievanceList.add(g);
        }
        String html = "";
        StringBuffer buffer = new StringBuffer();
        buffer.append("&nbsp;&nbsp;共为");
        buffer.append(maxPage);
        buffer.append("页&nbsp; 共有");
        buffer.append(pageNumber);
        buffer.append("条&nbsp; 当前为第");
        buffer.append((Integer.parseInt(number) + 1));
        buffer.append("页 &nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("首页");
        } else {
            buffer.append("<a href=\"index/myGrievance.action?number=0\">首页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("上一页");
        } else {
            buffer.append("<a href=\"index/myGrievance.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("下一页");
        } else {
            buffer.append("<a href=\"index/myGrievance.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("尾页");
        } else {
            buffer.append("<a href=\"index/myGrievance.action?number=" + (maxPage - 1) + "\">尾页</a>");
        }
        html = buffer.toString();
        this.getRequest().setAttribute("html", html);
        this.getRequest().setAttribute("grievanceList", grievanceList);
        return "users/myGrievance";
    }

    // 准备付款
    @RequestMapping("prePay.action")
    public String prePay(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        this.getRequest().setAttribute("id", id);
        return "users/pay";
    }

    // 在线付款
    @RequestMapping("pay.action")
    public String pay(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = this.ordersDAO.getOrdersById(id);
        orders.setStatus("已付款");
        this.ordersDAO.updateOrders(orders);
        Pay pay = new Pay();
        pay.setAddtime(VeDate.getStringDateShort());
        pay.setCate("在线付款");
        pay.setMoney(orders.getMoney());
        pay.setOrdercode(orders.getOrdercode());
        pay.setPayid(VeDate.getStringDatex());
        pay.setUsersid(orders.getUsersid());
        this.payDAO.insertPay(pay);
        Details details = new Details();
        details.setOrdercode(pay.getOrdercode());
        List<Details> list = this.detailsDAO.getDetailsByCond(details);
        if (list.size() != 0) {
            Details d = list.get(0);
            d.setStatus("已结算");
            this.detailsDAO.updateDetails(d);
            Drivers drivers = this.driversDAO.getDriversById(d.getDriversid());
            drivers.setMoney(drivers.getMoney() + (orders.getMoney()));
            drivers.setNum(drivers.getNum()+5);
            drivers.setMoney(drivers.getMoney()+orders.getMoney());
            this.driversDAO.updateDrivers(drivers);
        }
        return "redirect:/index/myOrder.action";
    }

    // 现金付款
    @RequestMapping("pays.action")
    public String pays(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = this.ordersDAO.getOrdersById(id);
        orders.setStatus("已付款");
        this.ordersDAO.updateOrders(orders);
        Pay pay = new Pay();
        pay.setAddtime(VeDate.getStringDateShort());
        pay.setCate("现金付款");
        pay.setMoney(orders.getMoney());
        pay.setOrdercode(orders.getOrdercode());
        pay.setPayid(VeDate.getStringDatex());
        pay.setUsersid(orders.getUsersid());
        this.payDAO.insertPay(pay);
        Details details = new Details();
        details.setOrdercode(pay.getOrdercode());
        List<Details> list = this.detailsDAO.getDetailsByCond(details);
        if (list.size() != 0) {
            Details d = list.get(0);
            d.setStatus("已结算");
            this.detailsDAO.updateDetails(d);
            Drivers drivers = this.driversDAO.getDriversById(d.getDriversid());
            drivers.setNum(drivers.getNum()+5);
            drivers.setMoney(drivers.getMoney()+orders.getMoney());
            this.driversDAO.updateDrivers(drivers);
        }
        return "redirect:/index/myOrder.action";
    }

    @RequestMapping("preTopic.action")
    public String preTopic(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        this.getRequest().setAttribute("id", id);
        return "users/addtopic";
    }

    @RequestMapping("addtopic.action")
    public String addtopic(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = this.ordersDAO.getOrdersById(id);
        orders.setStatus("已评价");
        this.ordersDAO.updateOrders(orders);
        Details details = new Details();
        details.setOrdercode(orders.getOrdercode());
        List<Details> list = this.detailsDAO.getDetailsByCond(details);
        if (list.size() != 0) {
            Details d = list.get(0);
            d.setStatus("已结算");
            this.detailsDAO.updateDetails(d);
            Topic topic = new Topic();
            topic.setAddtime(VeDate.getStringDateShort());
            topic.setContents(this.getRequest().getParameter("contents"));
            topic.setDriversid(d.getDriversid());
            topic.setNum(Integer.parseInt(this.getRequest().getParameter("num")));
            topic.setUsersid(orders.getUsersid());
            topic.setTopicid(VeDate.getStringDatex());
            topic.setOrdercode(orders.getOrdercode());
            this.topicDAO.insertTopic(topic);
            Drivers drivers = this.driversDAO.getDriversById(topic.getDriversid());
            drivers.setNum(drivers.getNum() + topic.getNum() - 5);
            this.driversDAO.updateDrivers(drivers);
        }
        return "redirect:/index/myOrder.action";
    }

    // 可接订单
    @RequestMapping("showOrders.action")
    public String showOrders(String number) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = new Orders();
        orders.setStatus("未接单");
        List<Orders> ordersList = new ArrayList<Orders>();
        List<Orders> tempList = new ArrayList<Orders>();
        tempList = this.ordersDAO.getOrdersByCond(orders);
        int pageNumber = tempList.size();
        int maxPage = pageNumber;
        if (maxPage % 10 == 0) {
            maxPage = maxPage / 10;
        } else {
            maxPage = maxPage / 10 + 1;
        }
        if (number == null) {
            number = "0";
        }
        int start = Integer.parseInt(number) * 10;
        int over = (Integer.parseInt(number) + 1) * 10;
        int count = pageNumber - over;
        if (count <= 0) {
            over = pageNumber;
        }
        for (int i = start; i < over; i++) {
            Orders o = tempList.get(i);
            ordersList.add(o);
        }
        String html = "";
        StringBuffer buffer = new StringBuffer();
        buffer.append("&nbsp;&nbsp;共为");
        buffer.append(maxPage);
        buffer.append("页&nbsp; 共有");
        buffer.append(pageNumber);
        buffer.append("条&nbsp; 当前为第");
        buffer.append((Integer.parseInt(number) + 1));
        buffer.append("页 &nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("首页");
        } else {
            buffer.append("<a href=\"index/showOrders.action?number=0\">首页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("上一页");
        } else {
            buffer.append("<a href=\"index/showOrders.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("下一页");
        } else {
            buffer.append("<a href=\"index/showOrders.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("尾页");
        } else {
            buffer.append("<a href=\"index/showOrders.action?number=" + (maxPage - 1) + "\">尾页</a>");
        }
        html = buffer.toString();
        this.getRequest().setAttribute("html", html);
        this.getRequest().setAttribute("ordersList", ordersList);
        return "users/showorder";
    }

    // 司机订单记录
    @RequestMapping("dorders.action")
    public String dorders(String number) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        Details details = new Details();
        details.setDriversid(userid);
        List<Details> dList = this.detailsDAO.getDetailsByCond(details);
        List<Orders> ordersList = new ArrayList<Orders>();
        List<Orders> tempList = new ArrayList<Orders>();
        for (Details d : dList) {
            Orders orders = new Orders();
            orders.setOrdercode(d.getOrdercode());
            orders.setDelstatus(2);
            List<Orders> oList = this.ordersDAO.getOrdersByCond(orders);
            if (oList.size() != 0) {
                Orders o = oList.get(0);
                tempList.add(o);
            }

        }
        int pageNumber = tempList.size();
        int maxPage = pageNumber;
        if (maxPage % 10 == 0) {
            maxPage = maxPage / 10;
        } else {
            maxPage = maxPage / 10 + 1;
        }
        if (number == null) {
            number = "0";
        }
        int start = Integer.parseInt(number) * 10;
        int over = (Integer.parseInt(number) + 1) * 10;
        int count = pageNumber - over;
        if (count <= 0) {
            over = pageNumber;
        }
        for (int i = start; i < over; i++) {
            Orders orders = tempList.get(i);
            ordersList.add(orders);
        }
        String html = "";
        StringBuffer buffer = new StringBuffer();
        buffer.append("&nbsp;&nbsp;共为");
        buffer.append(maxPage);
        buffer.append("页&nbsp; 共有");
        buffer.append(pageNumber);
        buffer.append("条&nbsp; 当前为第");
        buffer.append((Integer.parseInt(number) + 1));
        buffer.append("页 &nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("首页");
        } else {
            buffer.append("<a href=\"index/dorders.action?number=0\">首页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("上一页");
        } else {
            buffer.append("<a href=\"index/dorders.action?number=" + (Integer.parseInt(number) - 1) + "\">上一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("下一页");
        } else {
            buffer.append("<a href=\"index/dorders.action?number=" + (Integer.parseInt(number) + 1) + "\">下一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("尾页");
        } else {
            buffer.append("<a href=\"index/dorders.action?number=" + (maxPage - 1) + "\">尾页</a>");
        }
        html = buffer.toString();
        this.getRequest().setAttribute("html", html);
        this.getRequest().setAttribute("ordersList", ordersList);
        return "users/dorder";
    }

    // 取消订单
    @RequestMapping("dcancel.action")
    public String dcancel(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = this.ordersDAO.getOrdersById(id);
        orders.setStatus("司机取消");
        this.ordersDAO.updateOrders(orders);
        Details d = new Details();
        d.setOrdercode(orders.getOrdercode());
        List<Details> detailsList = this.detailsDAO.getDetailsByCond(d);
        if (detailsList.size() != 0) {
            Details details = detailsList.get(0);
            details.setStatus("已取消");
            this.detailsDAO.updateDetails(details);
        }
        return "redirect:/index/dorders.action";
    }

    // 准备申请
    @RequestMapping("preapply.action")
    public String preapply() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String driversid = (String) this.getSession().getAttribute("userid");
        Drivers drivers = driversDAO.getDriversById(driversid);
        this.getRequest().setAttribute("money", drivers.getMoney());
        return "users/addapply";
    }

    // 提交申请
    @RequestMapping("addapply.action")
    public String addapply(Applys applys) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        applys.setAddtime(VeDate.getStringDateShort());
        applys.setApplysid(VeDate.getStringDatex());
        applys.setDriversid(userid);
        applys.setStatus("未审批");
        this.applysDAO.insertApplys(applys);
        Drivers drivers = driversDAO.getDriversById(userid);
        drivers.setMoney(drivers.getMoney()-applys.getMoney());
        driversDAO.updateDrivers(drivers);
        return "redirect:/index/preapply.action";
    }

    // 我的申请
    @RequestMapping("myapply.action")
    public String myapply(String cond, String name, String number) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        Applys a = new Applys();
        a.setDriversid(userid);
        List<Applys> applysList = new ArrayList<Applys>();
        List<Applys> tempList = new ArrayList<Applys>();
        Applys applys = new Applys();
        if (cond != null) {
            if ("withdrawtoWays".equals(cond)) {
                applys.setWithdrawtoWays(name);
                tempList = this.applysDAO.getApplysByLike(applys);
            }
            if ("withdrawtoNum".equals(cond)) {
                applys.setWithdrawtoNum(name);
                tempList = this.applysDAO.getApplysByLike(applys);
            }
            if ("money".equals(cond)) {
                if(!name.equals("")){
                    applys.setMoney(Double.parseDouble(name));
                    tempList = this.applysDAO.getApplysByLike(applys);
                }else{
                    tempList = this.applysDAO.getApplysByCond(a);
                }
            }
            if ("addtime".equals(cond)) {
                applys.setAddtime(name);
                tempList = this.applysDAO.getApplysByLike(applys);
            }
            if ("status".equals(cond)) {
                applys.setStatus(name);
                tempList = this.applysDAO.getApplysByLike(applys);
            }
        }else{
            tempList = this.applysDAO.getApplysByCond(a);
        }
        int pageNumber = tempList.size();
        int maxPage = pageNumber;
        if (maxPage % 10 == 0) {
            maxPage = maxPage / 10;
        } else {
            maxPage = maxPage / 10 + 1;
        }
        if (number == null) {
            number = "0";
        }
        int start = Integer.parseInt(number) * 10;
        int over = (Integer.parseInt(number) + 1) * 10;
        int count = pageNumber - over;
        if (count <= 0) {
            over = pageNumber;
        }
        for (int i = start; i < over; i++) {
            Applys applys1 = tempList.get(i);
            applysList.add(applys1);
        }
        String html = "";
        StringBuffer buffer = new StringBuffer();
        buffer.append("&nbsp;&nbsp;共为");
        buffer.append(maxPage);
        buffer.append("页&nbsp; 共有");
        buffer.append(pageNumber);
        buffer.append("条&nbsp; 当前为第");
        buffer.append((Integer.parseInt(number) + 1));
        buffer.append("页 &nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("首页");
        } else {
            buffer.append("<a href=\"index/myapply.action?number=0&&cond="+ cond +"&&name="+ name +"\">首页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if ((Integer.parseInt(number) + 1) == 1) {
            buffer.append("上一页");
        } else {
            buffer.append("<a href=\"index/myapply.action?number=" + (Integer.parseInt(number) - 1) + "&&cond="+ cond +"&&name="+ name +"\">上一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("下一页");
        } else {
            buffer.append("<a href=\"index/myapply.action?number=" + (Integer.parseInt(number) + 1) + "&&cond="+ cond +"&&name="+ name +"\">下一页</a>");
        }
        buffer.append("&nbsp;&nbsp;");
        if (maxPage <= (Integer.parseInt(number) + 1)) {
            buffer.append("尾页");
        } else {
            buffer.append("<a href=\"index/myapply.action?number=" + (maxPage - 1) + "&&cond="+ cond +"&&name="+ name +"\">尾页</a>");
        }
        html = buffer.toString();
        this.getRequest().setAttribute("html", html);
        this.getRequest().setAttribute("applysList", applysList);
        this.getRequest().setAttribute("cond", cond);
        this.getRequest().setAttribute("name", name);
        return "users/myapply";
    }

    // 司机接单
    @RequestMapping("preorder.action")
    public String preorder(String id) {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        this.getRequest().setAttribute("id", id);
        return "users/getorder";
    }

    // 司机接单
    @RequestMapping("order.action")
    public String order(String id) {
        synchronized (id) {
            this.front();
            if (this.getSession().getAttribute("userid") == null) {
                return "redirect:/index/preLogin.action";
            }
            Orders orders = this.ordersDAO.getOrdersById(id);
            if(!orders.getStatus().equals("未接单")){
                this.getSession().setAttribute("haveOrder", "该订单已经被接走了，请接取其他订单");
                return "users/showorder";
            }
            orders.setStatus("已接单");
            orders.setMoney(0);
            String userid = (String) this.getSession().getAttribute("userid");
            orders.setTel(driversDAO.getDriversById(userid).getContact());
            orders.setDriversid(driversDAO.getDriversById(userid).getDriversid());
            this.ordersDAO.updateOrders(orders);
            Details details = new Details();
            details.setAddtime(VeDate.getStringDate());
            details.setDetailsid(VeDate.getStringDatex());
            details.setDriversid(userid);
            details.setOrdercode(orders.getOrdercode());
            details.setStatus("未完成");
            this.detailsDAO.insertDetails(details);
            return "redirect:/index/dorders.action";
        }
    }

    //开始服务
    @RequestMapping("startservel")
    public String startservel(String id){
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = ordersDAO.getOrdersById(id);
        orders.setStatus("服务中");
        orders.setGotime(VeDate.getStringDate());
        ordersDAO.updateOrders(orders);
        return "redirect:/index/dorders.action";
    }
    
    //输入路程，计算订单金额
    @RequestMapping("countOrderMoney")
    public String countOrderMoney(String ordersid,double money){
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = ordersDAO.getOrdersById(ordersid);
        orders.setMoney(money);
        ordersDAO.updateOrders(orders);
        return "redirect:/index/dorders.action";
    }
    //结算
    @RequestMapping("settlement")
    public String settlement(String id){
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        Orders orders = ordersDAO.getOrdersById(id);
        orders.setStatus("付款中");
        ordersDAO.updateOrders(orders);
        return "redirect:/index/dorders.action";
    }
    
    // 司机订单
    @RequestMapping("driversOrders.action")
    public String driversOrders() {
        this.front();
        if (this.getSession().getAttribute("userid") == null) {
            return "redirect:/index/preLogin.action";
        }
        String userid = (String) this.getSession().getAttribute("userid");
        Details details = new Details();
        details.setDriversid(userid);
        List<Details> detailsList = this.detailsDAO.getDetailsByCond(details);
        List<Orders> ordersList = new ArrayList<Orders>();
        for (Details d : detailsList) {
            Orders o = new Orders();
            o.setOrdercode(d.getOrdercode());
            List<Orders> list = this.ordersDAO.getOrdersByCond(o);
            if (list.size() > 0) {
                Orders orders = list.get(0);
                ordersList.add(orders);
            }
        }

        this.getRequest().setAttribute("ordersList", ordersList);
        return "users/mydetails";
    }
    
    //设置msg的值为空
    @RequestMapping("setSessionNull.action")
    @ResponseBody
    public String setSessionNull(String msg){
        this.getSession().setAttribute("loginmsg", "");
        return msg;
    }
    //设置msg的值为空
    @RequestMapping("setSessionNull1.action")
    @ResponseBody
    public String setSessionNull1(String msg){
        this.getSession().setAttribute("msg", "");
        return msg;
    }
}
