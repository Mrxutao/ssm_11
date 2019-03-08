package com.ssm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Bill;
import com.ssm.pojo.Provider;
import com.ssm.service.BillService;
import com.ssm.service.ProviderService;
import com.ssm.service.UserService;

@Controller
@RequestMapping("/bill")
public class BillController {

	@Resource
	private BillService billService;
	private ProviderService providerService;
	/**
	 * 查询所有商品列表
	 */
	@RequestMapping("/billList")
	public String billList(Model model,@RequestParam(value="queryProductName",required=false)String queryProductName,
			@RequestParam(value="queryProviderId",required=false)String queryProviderId,
			@RequestParam(value="queryIsPayment",required=false)String queryIsPayment,
			@RequestParam(value = "pageIndex", required = false) String pageIndex) {
		
		List<Bill>billList=null;
		int cuurrentPageNo = 0;
		int indexs = 1;
		if(pageIndex!=null &&pageIndex!="") {
			indexs=Integer.parseInt(pageIndex);
		}
		cuurrentPageNo = (indexs - 1) * 8;
		String productName=null;
		int providerId=0;
		int isPayment=0;
		if(queryProductName!=null && queryProductName!="") {
			productName=queryProductName;
		}
		if(queryProviderId!=null &&queryProviderId!="") {
			providerId=Integer.parseInt(queryProviderId);
		}
		if(queryIsPayment!=null && queryIsPayment!="") {
			isPayment=Integer.parseInt(queryIsPayment);
		}
		int tatalCount=billService.getLikeBill(queryProductName, providerId, isPayment);
		int pageCount = tatalCount % 8 == 0 ? tatalCount / 8 : (tatalCount / 8) + 1;
		billList=billService.getPageBill(productName, providerId, isPayment, cuurrentPageNo);
		model.addAttribute("billList", billList);
		List<Provider>providerList=billService.getProviderF();
		model.addAttribute("providerList", providerList);
		model.addAttribute("querName",productName);
		model.addAttribute("querproviderId", providerId);
		model.addAttribute("queisPayment",isPayment);
		model.addAttribute("totalCount", tatalCount);
		model.addAttribute("index", indexs);
		model.addAttribute("pageCount", pageCount);
		/*List<Bill>billList=billService.Findmerchandise();
		List<Provider>providerlist=billService.getProviderF();
		PageHelper.startPage(pn, 8);
		PageInfo<Bill>info=new PageInfo(billList,8);
		model.addAttribute("providerlist", providerlist);
		model.addAttribute("billList", info);*/
		return "billlist";
	}
	
	/**
	 * 根据id删除
	 */
	@RequestMapping("/billdel")
	public String billdel(Integer id,Model model) {
		Integer billList=billService.billdel(id);
		model.addAttribute("billList", billList);
		return "redirect:/bill/billList.do";
	}
	
	/**
	 * 根据id查看商品
	 */
	@RequestMapping("/findbill")
	public String findbill(Model model,Integer id) {
		Bill bill=billService.get(id);
		model.addAttribute("bill", bill);
		return "billview";
	}
	
	/**
	 * 根据id修改商品
	 */
	@RequestMapping("/toupdate")
	public String toupdate(Integer billid,Model model) {
		Bill bill=billService.get(billid);
		model.addAttribute("bill", bill);
		return"billmodify";
	}
	/**
	 * 跳转商品页面
	 */
	@RequestMapping("/toBillAdd")
	public String toBillAdd(Model model) {
		List<Provider>providerList=billService.getProviderF();
		model.addAttribute("providerList", providerList);
		return"billadd";
	}
	
	/**
	 * 添加商品
	 */
	@RequestMapping("/toAddBill")
	public String toAddBill(Bill bill) {
		Integer i=billService.addbill(bill);
		if(i>0) {
			return"redirect:/bill/billList.do";
		}
		return"error";
	}
}
