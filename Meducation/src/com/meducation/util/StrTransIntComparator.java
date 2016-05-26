package com.meducation.util;

import java.util.Comparator;

import org.displaytag.model.Cell;

@SuppressWarnings("rawtypes")
public class StrTransIntComparator implements Comparator {

	@Override
	public int compare(Object obj1, Object obj2) {
		String o1 = null;
		String o2 = null;

		if (obj1 instanceof Cell) {
			o1 = ((String) ((Cell) obj1).getStaticValue()).trim();
		}
		if (obj2 instanceof Cell) {
			o2 = ((String) ((Cell) obj2).getStaticValue()).trim();
		}
		double val1 = Double.valueOf(o1);
		double val2 = Double.valueOf(o2);
		if (val1 < val2) {
			return 1;
		}
		if (val1 > val2) {
			return -1;
		}
		return 0;
	}

}
