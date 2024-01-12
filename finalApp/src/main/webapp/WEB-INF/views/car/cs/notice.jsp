<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@charset "utf-8";

* { padding: 0; margin: 0; }


body {
font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
font-size: 14px;
color: #222;
  text-align: center;
}

.container {
  width: 1080px;
  margin: 0 auto; 
}

.content-container {
  width: 100%;

}

.main-title {
  width: 100%;  
}

.main-title {
  width: 100%;
  text-align: left;
  font-size: 30px;
  padding: 15px;
}


.search-container {
  padding: 15px;
  background-color: #f9f7f9;
}

.search-container form {
  display: inline-flex;
}

input[type=text] {
  height: 40px;
  width: 400px;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
  margin: 0;
}

.searchbutton {
  background: #555;
  color: #fff;
  width: 80px;
  height: 40px;
  padding: 7px 14px;
  border: #555;
  border-radius : 0;
  
}

/*테이블 css*/
table {
  width: 95%;
  margin: 0 auto;
  border-collapse: collapse;
  border-spacing: 0;

}

table tr {
  height: 50px;
}

table tr, th {
  border-top: 1px solid #e7e7e7;
  border-bottom: 1px solid #ccc;
}

td:nth-child(2) {
  text-align: left;
}

/*글올리기버튼 css*/

.upload_button {
  width: 100%;
  height: 50px;
  
}
.upload_button button {
  background: #555;
  color: #fff;
  width: 100px;
  height: 30px;
  padding: 3px 7px;
  border: none;
  float: right;
  margin:20px;
}

/*페이징*/
.page-navigation {
  margin-top: 30px;
}




</style>

<div class="container">
    <div class="content-container">
        <div class="main-title">
            <p><i class="fa-solid fa-bookmark" style="margin-right: 10px;"></i> 공지사항 </p>
        </div>

        <div class="search-container">
            <form name="searchForm" action="" method="post">
                <input type="text" name="kwd" placeholder="검색어를 입력해주세요." value="">
                <button type="button" class="btn btn-dark searchbutton"  onclick="">검색</button>
            </form>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th width="70">번호</th>
                        <th>제목</th>
                        <th width="100">작성자</th>
                        <th width="100">작성일</th>
                        <th width="70">조회수</th>
                    </tr>
                </thead>
                
                <tbody>
                        <tr>
                            <td><span class="">1</span></td>
                            <td>
                                <a href="#">제목입니다.</a>
                            </td>
                            <td>관리자</td>
                            <td>2023.12.21</td>
                            <td>5</td>
                        </tr>
                </tbody>
            </table>
        </div> 

        
        <div class="upload_button">
            <button type="button" class="btn btn-dark">글올리기</button>
        </div>

        <div class="page-navigation">
        1 2 3
        </div>
    </div>
</div>	