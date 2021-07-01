package model;

public class Student {
  private  int stuId;
  private String stuName;
  private int classId;
  private String stuPic;
  private String stuDesc;
  private int sex;
public int getStuId() {
	return stuId;
}
public void setStuId(int stuId) {
	this.stuId = stuId;
}
public String getStuName() {
	return stuName;
}
public void setStuName(String stuName) {
	this.stuName = stuName;
}
public int getClassId() {
	return classId;
}
public void setClassId(int classId) {
	this.classId = classId;
}
public String getStuPic() {
	return stuPic;
}
public void setStuPic(String stuPic) {
	this.stuPic = stuPic;
}
public String getStuDesc() {
	return stuDesc;
}
public void setStuDesc(String stuDesc) {
	this.stuDesc = stuDesc;
}
public int getSex() {
	return sex;
}
public void setSex(int sex) {
	this.sex = sex;
}
@Override
public String toString() {
	return "Student [stuId=" + stuId + ", stuName=" + stuName + ", classId="
			+ classId + ", stuPic=" + stuPic + ", stuDesc=" + stuDesc
			+ ", sex=" + sex + "]";
}
public Student(int stuId, String stuName, int classId, String stuPic,
		String stuDesc, int sex) {
	super();
	this.stuId = stuId;
	this.stuName = stuName;
	this.classId = classId;
	this.stuPic = stuPic;
	this.stuDesc = stuDesc;
	this.sex = sex;
}
  
  
  
}
