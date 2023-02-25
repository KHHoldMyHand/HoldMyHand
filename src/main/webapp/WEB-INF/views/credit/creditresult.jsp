<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

 <style type="text/css">
 .ss{color:blue; font-size:40px; font-weight:border; }

table tr{
	height: 30px;
}

 </style>



<section class="py-5" id="features">
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <div class="corp_info">

              <h3>&nbsp&nbsp&nbsp <svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" fill="currentColor" class="bi bi-file-earmark-bar-graph" viewBox="0 0 16 16">
                     <path d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z"/>
                     <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
                   </svg> 기업 브리핑   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" fill="currentColor" class="bi bi-file-earmark-bar-graph" viewBox="0 0 16 16">
                    <path d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z"/>
                    <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>  </svg>&nbsp기업등급의 정의</h3>



                    <!-- 여기서부터 첫번째 묶음 -->
              <div class="container">
                <div class="row">
                  <div class="col-6">

                    <table summary="This table shows how to create responsive tables using Datatables' extended functionality"
                    class="table table-bordered table-hover dt-responsive" >

                      <thead>
                        <tr>
                          <th>기업명</th>
                          <th>FutureIsArtemis</th>

                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>사업자 등록번호</td>
                          <td>105-**-*****</td>

                        </tr>
                        <tr>
                          <td>대표자</td>
                          <td>김비오</td>

                        </tr>
                        <tr>
                          <td>본사주소</td>
                          <td>경기도 시흥시 능곡중앙로33</td>

                        </tr>
                        <tr>
                          <td>대표전화</td>
                          <td>010-2429-4283</td>

                        </tr>
                        <tr>
                          <td>설립일자</td>
                          <td>2023년 02월 21일</td>

                        </tr>
                        <tr>
                          <td>기업분류</td>
                          <td>외감</td>

                        </tr>
                         <tr>
                          <td>기업규모</td>
                          <td>중소기업</td>

                         </tr>
                        <tr>
                        <td>업종명</td>
                        <td>트레이딩 주식투자</td>

                        </tr>

                         <tr>
                          <td>종업원수</td>
                          <td>1명</td>

                          </tr>
                         <tr>
                         <td>기업분류</td>
                          <td>외감</td>

                         </tr>
                          <tr>
                         <td>기업분류</td>
                         <td>외감</td>

                         </tr>

                      </tbody>
                    </table>
                      </div>




                    <div class="col-6">
                    <table summary="This table shows how to create responsive tables using Datatables' extended functionality"
                                        class="table table-bordered table-hover dt-responsive">

                         <thead>
                        <tr>
                        <th width="20%">등급</th>
                        <th width="80%">기업등급의 정의</th>

                           </tr>
                         </thead>
                          <tbody>
                          <tr>
                          <td>AAA</td>
                          <td>상거래 신용능력이 최고 우량한 수준임</td>

                        </tr>
                        <tr>
                        <td>AA</td>
                         <td>상거래 신용능력이 매우 우량하나, AAA보다는 다소 열위한 요소가 있음</td>

                        </tr>
                           <tr>
                          <td>A</td>
                         <td>상거래 신용능력이 우량하나, 상위등급에 비해 경기침체 및 환경변화의 영향을 받기 쉬움</td>

                          </tr>
                           <tr>
                            <td>BBB</td>
                             <td>상거래 신용능력은 안정되나, 장래 경기침체 및 환경악화에 따라 상거래 신용능력이 저하될 가능성이 내포되어 있음</td>

                              </tr>
                                <tr>
                              <td>BB</td>
                                <td>상거래 신용능력은 인정되나, 장래의 경제여건 및 시장환경 변화에 따라 그 안정성면에서는 다소 불안한 요소가 내포되어 있음</td>

                               </tr>
                                 <tr>
                                <td>B</td>
                                <td>현재시점에서 상거래 신용능력에는 당면 문제는 없으나, 장래의 경제여건 및 시장환경 안정선면에서 불안한 요소가 있음 </td>

                                 </tr>
                                 <tr>
                                 <td>CCC</td>
                                   <td>현재시점에서 상거래 신용위험 가능성을 내포하고 있어 투기적임</td>

                                   </tr>
                                <tr>
                                <td>CC</td>
                                <td>상거래 신용위험의 가능성이 높음</td>

                                 </tr>

                                 <tr>
                                  <td>C</td>
                                 <td>상거래 신용위험의 가능성이 매우 높음</td>

                                   </tr>
                                    <tr>
                                 <td>D</td>
                                 <td>현재 상거래 신용위험 발생 상태에 있음</td>

                                 </tr>
                                  <tr>
                                  <td>NR</td>
                                   <td>조사거부, 등급취소 등의 이유로 기업등급을 표시하지 않는 무등급</td>

                                 </tr>

                                 </tbody>
                                  </table>
                            </div>

                  </div>
                </div>
              </div>

                    <!-- 첫묶음 끝 -->


                    <!-- 두번쨰 묶음 시작 -->
                <div class="container">
                <div class="row">
                  <div class="col-6">
    <h3><svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" fill="currentColor" class="bi bi-file-earmark-bar-graph" viewBox="0 0 16 16">
                                  <path d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z"/>
                                  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
                                  </svg> 기업등급</h3>
                    <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">

                  <tr>

                   <td style="border:2px solid blue;" align="center" valign="middle" rowspan= "2">
                   <p class="ss"> AA </p> <br>
                    <span style="color:black"><p> 채무상환능력이 매우 우량하나, AAA보다는 다소 열위한 요소가 있음</p></span> </td>

               </tr>



                    <table summary="This table shows how to create responsive tables using Datatables' extended functionality"
                    class="table table-bordered table-hover dt-responsive" >

                <tbody>
                 <tr>
                  <td >구분</td>
                 <td>신용등급</td>

                   </tr>
                    <tr>
                   <td>평가(산출)일자</td>
                   <td>2023-02-21</td>

                   </tr>

                  <tr>
                  <td >재무기준일자</td>
                  <td>2023-02-21</td>


                   </tr>

                    </tbody>

                   </table>
                   <p>· 신용등급 : 해당 기업등이 의뢰하여신용조사 (평정절차)를 거친 후 결정된 등급</p>
                     <p style= "line-height: 1.5;">· 모형등급 : 다양한 경로를통해 수집된 정보를 바탕으로 평가모형에의해 자동 산출된 등급
                      (해당기업의의뢰없이산출된 등급으로 소문자 표시되며,조사/평가시 변경될수 있습니다.)</p>
                      <p style= "line-height: 1.5;">· 기업등급은 '신용정보의 이용 및 보호에관한 법률'에의한 신용조회회사인 한국기업데이터
                      가 제공하는 것으로업무 목적외사용 및 제3자제공이 금지되어 있습니다.</p>
                    <p> · 본 등급은조달청 등 공공기관 입찰적격심사에활용하실 수 없습니다</p>


                      </div>



                    <div class="col-6">
                    <h3><svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" fill="currentColor" class="bi bi-file-earmark-bar-graph" viewBox="0 0 16 16">
                      <path d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z"/>
                      <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
                      </svg> 등급브리핑</h3>
                      <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">

                          <tr>

                           <td style="border:2px solid blue;" align="center" valign="middle" rowspan= "2"><span style="color:black"><H2> 기업등급<H2></span>
                        <br> <H2 style="color:blue" "font-weight:bold";> <strong>AA</strong> </td></H2></H2>

                       </tr>


                    <table summary="This table shows how to create responsive tables using Datatables' extended functionality"
                     class="table table-bordered table-hover dt-responsive" >

                     <tbody>
                    <tr>
                    <td >구분</td>
                    <td>신용등급</td>

                     </tr>
                      <tr>
                      <td>평가(산출)일자</td>
                     <td>2023-02-21</td>

                  </tr>

                      <tr>
                     <td >재무기준일자</td>
                     <td>2023-02-21</td>

                    </tr>

                 </tbody>
                  </table>

                  </div>
                </div>
              </div>

                <!-- 두번째 묶음 끝  -->

              <h3><svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" fill="currentColor" class="bi bi-file-earmark-bar-graph" viewBox="0 0 16 16">
              <path d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z"/>
              <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
              </svg> 기업신용정보 요약</h3>


           <table summary="This table shows how to create responsive tables using Datatables' extended functionality"
            class="table table-bordered table-hover dt-responsive">

              <tbody>
              <tr>
              <td >구분</td>
              <td>채무불이행</td>
              <td>카드발급/당좌개설</td>
              <td>기업회생/워크아웃</td>
              <td>당좌거래정지</td>

             </tr>
             <tr>
             <td>건수</td>
             <td>0</td>
             <td>1</td>
             <td>0</td>
             <td>0</td>




             </tr>
             </tbody>

           </table>




            </div>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>


