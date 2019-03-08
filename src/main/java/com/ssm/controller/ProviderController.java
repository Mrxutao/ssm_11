package com.ssm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssm.pojo.Provider;
import com.ssm.service.ProviderService;

@Controller
@RequestMapping("/provider")
public class ProviderController {

	@Resource
	private ProviderService providerService;

	/**
	 * 查询所有供应商列表
	 */
	@RequestMapping("/providerlist")
	public String findproviderList(Model model, @RequestParam(value = "queryProCode", required = false) String queryProCode,
			@RequestParam(value = "queryProName", required = false) String queryProName,
			@RequestParam(value = "pageIndex", required = false) String pageIndex) {
		List<Provider> providerList = null;
		int cuurrentPageNo = 0;
		int indexs = 1;
		if (pageIndex != null && pageIndex != "") {
			indexs = Integer.parseInt(pageIndex);
		}
		cuurrentPageNo = (indexs - 1) * 8;
		String proCode = null;
		String proName = null;
		if (queryProCode != null && queryProCode != "") {
			proCode = queryProCode;
		}
		if (queryProName != null && queryProName != "") {
			proName = queryProName;
		}
		int tatalCount = providerService.getLikePro(proCode, proName);
		int pageCount = tatalCount % 8 == 0 ? tatalCount / 8 : (tatalCount / 8) + 1;
		providerList = providerService.getmhcx(proCode, proName, cuurrentPageNo);
		model.addAttribute("providerList", providerList);
		model.addAttribute("proCode", proCode);
		model.addAttribute("proName", proName);
		model.addAttribute("totalCount", tatalCount);
		model.addAttribute("index", indexs);
		model.addAttribute("pageCount", pageCount);
		
		return "providerlist";
	}

	/**
	 * 模糊查询
	 */
	@RequestMapping("/findlike")
	public String findlike(String queryProCode, String queryProName, Model model) {
		List<Provider> ProviderList = providerService.getProviderfindllike(queryProCode, queryProName);
		model.addAttribute("ProviderList", ProviderList);
		return "providerlist";
	}

	/**
	 * 根据id查询
	 */
	@RequestMapping("/findprovider")
	public String findprovider(Integer id, Model model) {
		Provider provider = providerService.get(id);
		model.addAttribute("provider", provider);
		return "providerview";
	}

	/**
	 * 根据id删除供应商
	 */
	@RequestMapping("/delprovider")
	public String delProvider(@RequestParam Integer id) {
		Integer i = providerService.delProvider(id);
		/*
		 * if(i!=1) { return"false"; } return"true";
		 */
		return "redirect:/provider/providerlist.do";
	}

	/**
	 * 根据id查看供应商、修改。
	 */
	@RequestMapping("/findidupdate")
	public String findidupdate(Integer proid, Model model) {
		Provider provider = providerService.get(proid);
		model.addAttribute("provider", provider);
		return "providermodify";
	}

	/**
	 * 修改供应商
	 */
	@RequestMapping("providerupdate")
	public String providerupdate(Provider provider, Model model) {
		Integer i = providerService.updateProvider(provider);
		if (i > 0) {
			return "redirect:/provider/providerlist.do";
		}
		return "error";
	}

	/**
	 * 跳转添加供应商页面
	 */
	@RequestMapping("/toAddProvideryemian")
	public String toAddProvider() {
		return "provideradd";
	}

	/**
	 * 添加供应商
	 */
	@RequestMapping("/toAddProvider")
	public String toAddProvider(Provider provider) {
		Integer i = providerService.addProvidr(provider);
		if (i > 0) {
			return "redirect:/provider/providerlist.do";
		}
		return "error";
	}

	/*
	 * @RequestMapping(value = "providerlist23") public String getlist(Model model,
	 * 
	 * @RequestParam(value = "proCode", required = false) String queryProName,
	 * 
	 * @RequestParam(value = "proName", required = false) String queryProCode,
	 * 
	 * @RequestParam(value = "index", required = false) String pageIndex ) {
	 * List<Provider> providerlist = null; int cuurrentPageNo = 0; int indexs = 1;
	 * if (pageIndex != null && pageIndex != "") { indexs =
	 * Integer.parseInt(pageIndex); } cuurrentPageNo = (indexs - 1) * 7; String
	 * queryname = null; String queryUserRole = null; if (queryProName != null &&
	 * queryProName != "") { queryname = queryProName; } if (queryProCode != null &&
	 * queryProCode != "") { queryUserRole = queryProCode; } int tatalCount =
	 * providerService.getProviderfindllike(queryProCode, queryProName); ; int
	 * pageCount = tatalCount % 7 == 0 ? tatalCount / 7 : (tatalCount / 7) + 1;
	 * providerlist = providerService.getmhcx(queryProCode, queryProName,
	 * cuurrentPageNo); model.addAttribute("providerList", providerlist);
	 * model.addAttribute("queryProName", queryname);
	 * model.addAttribute("queryProCode", queryUserRole);
	 * model.addAttribute("totalCount", tatalCount); model.addAttribute("index",
	 * indexs); model.addAttribute("pageCount", pageCount); return "providerlist"; }
	 */
}
