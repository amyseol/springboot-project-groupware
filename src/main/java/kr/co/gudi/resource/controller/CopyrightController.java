package kr.co.gudi.resource.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import kr.co.gudi.resource.service.CopyrightService;

@RestController
public class CopyrightController {
	@Autowired
	CopyrightService service;

	Logger logger = LoggerFactory.getLogger(getClass());

	@GetMapping(value = "/copyrightlist")
	public ModelAndView cp() {
		ModelAndView mav = new ModelAndView("copyright/cr");
		return mav;
	}

	@PostMapping(value = "/copyrightgetlist")
	public Map<String, Object> copyrightlist(@RequestParam String pagePerNum, @RequestParam String page,
			@RequestParam String search, @RequestParam String searchtag) {
		Map<String, Object> data = service.copyrightlist(page, pagePerNum, search, searchtag);
		return data;
	}

	@PostMapping(value = "/copyrightnolist")
	public Map<String, Object> copyrightnolist(@RequestParam String pagePerNum, @RequestParam String page,
			@RequestParam String search, @RequestParam String searchtag) {
		Map<String, Object> data = service.copyrightnolist(page, pagePerNum, search, searchtag);
		return data;
	}

	@GetMapping(value = "/copyrightregisterform")
	public ModelAndView crg() {
		ModelAndView mav = new ModelAndView("copyright/crg");
		return mav;
	}

	@GetMapping(value = "/copyrightsearch")
	public HashMap<String, Object> getList(String page, String perPage, String search) {
		return service.getList(page, perPage, search);
	}

	@GetMapping(value = "/copyrightsearchdetail")
	public HashMap<String, Object> getListdetail(String page, String perPage, String search) {
		return service.getListdetail(page, perPage, search);
	}

	@PostMapping(value = "/copyrightregister")
	public ModelAndView copyrightregister(MultipartFile[] files, @RequestParam HashMap<String, String> data,
			HttpSession session) throws Exception {
		service.copyrightregister(data, files, session);
		ModelAndView mav = new ModelAndView("redirect:/copyrightlist");
		return mav;
	}

	@PostMapping(value = "/depttlist")
	public Map<String, Object> depttlist() {
		return service.depttlist();
	}

	@GetMapping(value = "/cancleform")
	public ModelAndView cancleform(@RequestParam String cr_no, @RequestParam String cr_namae) {
		ModelAndView mav = new ModelAndView("copyright/crc");
		mav.addObject("cr_no", cr_no);
		mav.addObject("cr_namae", cr_namae);
		return mav;
	}

	@GetMapping(value = "/copyrightdetail")
	public ModelAndView copyrightdetail(@RequestParam String num) {
		Map<String, Object> detail = service.detaildata(num);
		ModelAndView mav = new ModelAndView("copyright/crd");
		mav.addObject("data", detail);
		return mav;
	}

	@GetMapping(value = "/resourceCopyright")
	public ModelAndView resourceCopyright() {
		ModelAndView mav = new ModelAndView("resource_cr/resource_cr");
		return mav;
	}

	@GetMapping(value = "resourceCopyrightregister")
	public ModelAndView resourceCopyrightregister(@RequestParam String no, @RequestParam String date,
			@RequestParam String price, @RequestParam String namae, HttpSession session) {
		service.resourceCopyrightregister(no, date, price, namae, session);
		ModelAndView mav = new ModelAndView("redirect:/resourceCopyright");
		return mav;
	}

	@PostMapping(value = "/resourcecopyrightgetlist")
	public Map<String, Object> resourcecopyrightgetlist(@RequestParam String pagePerNum, @RequestParam String page,
			@RequestParam String search, @RequestParam String searchtag) {
		Map<String, Object> data = service.resourcecopyrightgetlist(page, pagePerNum, search, searchtag);
		return data;
	}

	@GetMapping(value = "resourceCopyrightdelete")
	public ModelAndView resourceCopyrightdelete(@RequestParam String cr_no, @RequestParam String per_price) {
		service.resourceCopyrightdelete(cr_no, per_price);
		ModelAndView mav = new ModelAndView("redirect:/resourceCopyright");
		return mav;
	}

	@GetMapping(value = "/crd2")
	public ModelAndView crd2(@RequestParam String approval_no) {
		ModelAndView mav = new ModelAndView("copyright/crd2");
		return service.crd2(approval_no, mav);
	}

	@GetMapping(value = "/okcr")
	public ModelAndView okcr(@RequestParam String no, @RequestParam String app) {
		ModelAndView mav = new ModelAndView("redirect:/draftBox");
		service.okcr(no, app);
		return mav;
	}

	@GetMapping(value = "/nocr")
	public ModelAndView nocr(@RequestParam String no, @RequestParam String app) {
		ModelAndView mav = new ModelAndView("redirect:/draftBox");
		service.nocr(no, app);
		return mav;
	}
}
