package withboard.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import withboard.mvc.domain.JoinMatch;
import withboard.mvc.domain.Member;
import withboard.mvc.service.JoinMatchService;
import withboard.mvc.service.MatchBoardService;
import withboard.mvc.somthing.Room;



@Controller
@RequiredArgsConstructor
public class MainController {
	private final JoinMatchService joinMatchService;
	
	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}
	
	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("room");
		return mv;
	}
int lastnum=0;
int roomNumber2=0;
int roomNumber3=0;

	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params,HttpSession session){
		
		String roomName = (String) params.get("roomName");
		
		List<JoinMatch> joinMatchList = joinMatchService.joinMatchList(session);
		JoinMatch[] strArray2 = joinMatchList.toArray(new JoinMatch[joinMatchList.size()]);
	System.out.println(strArray2);
		this.lastnum=(Math.toIntExact(strArray2[0].getJoinMatchNo()));	
			Room room = new Room();
			
				room.setRoomNumber(++this.lastnum);
			
			//room.setRoomNumber(roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
	
		return roomList; 	
	}

	boolean a= true;
//	/**
//	 * 방 정보가져오기
//	 * @param params
//	 * @return
//	 */
//	@RequestMapping("/getRoom")
//	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params,HttpSession session){
//		
//		if(a==true) {
//		List<JoinMatch> joinMatchList = joinMatchService.joinMatchList(session);
//		JoinMatch[] strArray = joinMatchList.toArray(new JoinMatch[joinMatchList.size()]);
//		for (int i =0; i< strArray.length;i++) {
//			Room room = new Room();
//			room.setRoomNumber(Math.toIntExact(strArray[i].getJoinMatchNo()));
//			room.setRoomName(strArray[i].getJoinMatchTitle());
//			roomList.add(room);
//			
//		}
//		a=false;
//			
//		}
////		String roomName = (String) joinMatchList.getJoinMatchTitle();
////		JoinMatch joinMatch = joinMatchService.joinMatchList2(session);
////		String roomName = (String) joinMatch.getJoinMatchTitle();
////		System.out.println(roomName);
//
//		return roomList;
//		
//	}
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
//@RequestMapping("/createRoom")
//public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
//	String roomName = (String) params.get("roomName");
//	if(roomName != null && !roomName.trim().equals("")) {
//		Room room = new Room();
//		room.setRoomNumber(++roomNumber);
//		room.setRoomName(roomName);
//		roomList.add(room);
//	}
//	return roomList;
//}

/**
 * 방 정보가져오기
 * @param params
 * @return
 */
@RequestMapping("/getRoom")
public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params,HttpSession session){
	//roomList.clear();
	//if(this.a==true) {
	List<JoinMatch> joinMatchList = joinMatchService.joinMatchList(session);
	JoinMatch[] strArray = joinMatchList.toArray(new JoinMatch[joinMatchList.size()]);
	
	
	for (int i=0; i< strArray.length;i++) {
		Room room = new Room();
	room.setRoomNumber(Math.toIntExact(strArray[i].getJoinMatchNo()));
	room.setRoomName(strArray[i].getJoinMatchTitle());
	roomList.add(room);
	}
	//this.a=false; 
	//}
	return roomList;
}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		
		List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.setViewName("chat");
		}else {
			mv.setViewName("room");
		}
		return mv;
	}
}