package com.kitri.factory;

import com.kitri.action.Action;
import com.kitri.freeboard.action.*;


public class FreeBoardActionFactory {
	private static Action freeBoardWriteAction;
	private static Action freeBoardListAction;
	private static Action freeBoardViewAction;
	
	static{
		freeBoardWriteAction = new FreeBoardWriteAction();
		freeBoardListAction = new FreeBoardListAction();
		freeBoardViewAction	= new FreeBoardViewAction();
	}

	
	public static Action getFreeBoardViewAction() {
		return freeBoardViewAction;
	}

	public static Action getFreeBoardWriteAction() {
		return freeBoardWriteAction;
	}

	public static Action getFreeBoardListAction() {
		return freeBoardListAction;
	}
}
