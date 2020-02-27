package model;

import static model.Utils.*;
import static view.Output.*;
import model.Developer;
import model.Human;
import model.Workable;

public class PM extends Employee {

	public PM() {

	}

	public PM(String name, int age, boolean isHasJob, int id, String placeOfWork, String calling, int cost) {
		super(name, age, isHasJob, id, placeOfWork, calling, cost);
	}
	
	public PM(PM pm) {
		super(pm);	
	}

	@Override
	public void work() {
		exhibitRed("Project manager is working!");
	}

//ref to company
	// field with companyname
	// no need to //
	public Developer searchById(Developer[] ms, int elem) {
		return binarySearch(ms, elem);
	}

	public void showDevs(Developer[] ms) {
		for (int i = 0; i < ms.length; i++) {
			exhibit(ms[i].toString());
		}
	}

	public Developer[] sortList(Developer[] ms, String key) {
		// ms dev[]
		// no plural return
		switch (key) {
		case "age":
			return sortAge(ms);
		case "skill":
			return sortSkill(ms);
		case "name":
			return sortName(ms);
		default:
			return null;
		}
	}

	@Override
	public int hashCode() {
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!super.equals(obj)) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return super.toString();
	}

}
