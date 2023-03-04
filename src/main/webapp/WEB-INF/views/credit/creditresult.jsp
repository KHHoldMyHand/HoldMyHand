<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>


<link rel="../resources/css/exam.css">
<section class="py-5 qnaMain creditResult" id="features">
    <div class="contain px-5 my-5">
        <div class="gx-5">
            <div class="row">
                <div class="col-6" style="margin-bottom: 50px;">
                    <h3 class="tit30B">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" fill="currentColor" class="bi bi-file-earmark-bar-graph" viewBox="0 0 16 16">
                            <path d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z"/>
                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
                        </svg>
                        기업 브리핑
                    </h3>
                    <div class="table_wrp">
                        <!-- 여기서부터 첫번째 묶음 -->
                        <table class="table table-bordered table-hover dt-responsive" >
                            <thead>
                            <tr>
                                <th>기업명</th>
                                <th>${login.corpName}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>보고서식별번호</td>
                                <td>${dto.reportNo}</td>
                            </tr>
                            <tr>
                                <td>설립자명</td>
                                <td>${dto.establishmentName}</td>
                            </tr>
                            <tr>
                                <td>설립일자</td>
                                <td>${dto.establishmentDate}</td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td>${login.userAddress}</td>
                            </tr>
                            <tr>
                                <td>기업종류</td>
                                <td>${login.corpType}</td>
                            </tr>
                            <tr>
                                <td>기업규모</td>
                                <td>${dto.companyScale}</td>
                            </tr>
                            <tr>
                                <td>사원수</td>
                                <td>${dto.employeers}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-6" style="margin-bottom: 50px;">
                    <h3 class="tit30B">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" fill="currentColor" class="bi bi-file-earmark-bar-graph" viewBox="0 0 16 16">
                            <path d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z"/>
                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
                        </svg>
                        기업등급
                    </h3>
                    <div class="table_wrp">
                        <div class="tit_wrp">
                            <span class="ss">${dto.reportRank}</span>
                            <!-- 질문사항: 등급마다 p안에 코맨트가 달려야하는데 1방안: 등급테이블을 만들어야하는지, 2방안: 등급만 표시해서 p태그 자체를 없앨지 -->
                            <span class="sb">채무상환능력이 매우 우량하나, AAA보다는 다소 열위한 요소가 있음</span>
                        </div>
                        <table class="table table-bordered table-hover dt-responsive" >
                            <thead>
                                <tr>
                                    <th >구분</th>
                                    <th>신용등급</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>평가(산출)일자</td>
                                    <td>${dto.createDate}</td>
                                </tr>
                                <tr>
                                    <td >재무기준일자</td>
                                    <td>${dto.fileDate}</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="text_wrp">
                            <li>신용등급 : 해당 기업등이 의뢰하여신용조사 (평정절차)를 거친 후 결정된 등급</li>
                            <li>모형등급 : 다양한 경로를통해 수집된 정보를 바탕으로 평가모형에의해 자동 산출된 등급
                                (해당기업의의뢰없이산출된 등급으로 소문자 표시되며,조사/평가시 변경될수 있습니다.)</li>
                            <li>기업등급은 '신용정보의 이용 및 보호에관한 법률'에의한 신용조회회사인 한국기업데이터
                                가 제공하는 것으로업무 목적외사용 및 제3자제공이 금지되어 있습니다.</li>
                            <li>본 등급은조달청 등 공공기관 입찰적격심사에활용하실 수 없습니다</li>
                        </div>
                    </div>
                </div>
                <div style="margin-bottom: 50px;" class="col-12">
                    <h3 class="tit30B">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" fill="currentColor" class="bi bi-file-earmark-bar-graph" viewBox="0 0 16 16">
                        <path d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z"/>
                        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
                        </svg>
                        기업신용정보 요약
                    </h3>
                    <div class="table_wrp">
                        <table class="table table-bordered table-hover dt-responsive">
                            <thead>
                                <tr>
                                    <th >구분</th>
                                    <th>채무불이행</th>
                                    <th>카드발급/당좌개설</th>
                                    <th>기업회생/워크아웃</th>
                                    <th>당좌거래정지</th>
                                </tr>
                            </thead>
                            <tbody>
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
                <div class="col-12">
                    <h3 class="tit30B">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="46" fill="currentColor" class="bi bi-file-earmark-bar-graph" viewBox="0 0 16 16">
                            <path d="M10 13.5a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v6zm-2.5.5a.5.5 0 0 1-.5-.5v-4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1zm-3 0a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-1z"/>
                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/>
                        </svg>
                        기업등급의 정의
                    </h3>
                    <div class="table_wrp">
                        <table class="table table-bordered table-hover dt-responsive">
                            <colgroup>
                                <col width="30%">
                                <col width="70%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>등급</th>
                                <th>기업등급의 정의</th>
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
    </div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jspf" %>