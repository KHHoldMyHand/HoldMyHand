<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jspf" %>
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>


<section class="py-5" id="features">
    <div class="container px-5 my-5">
        <div class="row gx-5">
            <title>회원가입</title>
            <link href="../resources/css/join.css" rel="stylesheet" type="text/css">
            <body>
            <div class="outer">
                <div id="joinInfoArea">
                    <form id="joinForm" action="<%=request.getContextPath()%>/user/join"
                          method="post" onsubmit="return validateForm()">
                        <h1 class="tit30B">회원 가입</h1>
                        <!-- ID(사업자등록번호) -->
                        <div class="gold_line">
                            <h4 class="tit17">* ID(사업자등록번호)</h4>
                            <span class="in_area"><input class="insert_input" type="text" id="userID" name="userID" required></span>
                            <button type="button" type="button" id="idChk" onclick="idCheck();" value="N" style="margin-left: 10px">중복확인</button>
                            <span class="useId_ok">사용 가능한 아이디입니다.</span>
                            <span class="useId_already">누군가 이 아이디를 사용하고 있어요.</span>
                        </div>

                        <!-- 비밀번호 -->
                        <div class="gold_line">
                            <h4 class="tit17">* 비밀번호</h4>
                            <span class="in_area"><input class="insert_input" type="password" maxlength="15"
                                                        name="userPwd" id=pw placeholder="영문,숫자,특수문자 8~15자 입력" required></span>

                            <h4 class="tit17">* 비밀번호 확인</h4>
                            <span class="in_area"><input class="insert_input" type="password" maxlength="15"
                                                            name="userPwd2" id=pw2 placeholder="영문,숫자,특수문자 8~15자 입력"
                                                            required></span>

                            <font id="checkPw" style="font-size: small;"></font>
                        </div>

                        <!-- 업체명 -->
                        <div class="gold_line">
                            <h4 class="tit17">* 업체명</h4>
                            <span class="in_area">
                                <input class="insert_input" type="text" id="corpName" name="corpName"
                                       placeholder="업체명" required="required">
                                <p class="txt_error" id="enp_nm_txt_error" style="display: none;">
                                    업체명을 입력해 주세요.</p>
                            </span>
                            <div class="select" style="margin: 10px 0 ;">
                                <select name="corpType" id="corpType"
                                        class="necessary insert_input"
                                        required title="기업종류"
                                        style="width: 200px; height: 39px; margin-top: 10px;">
                                    <option value="">기업종류</option>
                                    <option value="01">주식회사</option>
                                    <option value="02">합명회사</option>
                                    <option value="03">합자회사</option>
                                    <option value="04">유한회사</option>
                                    <option value="05">비영리재단법인</option>
                                    <option value="06">비영리사단법인</option>
                                    <option value="07">조합</option>
                                    <option value="08">외국법인</option>
                                    <option value="09">의료법인</option>
                                    <option value="10">학교법인</option>
                                    <option value="11">종교법인</option>
                                    <option value="12">학술장학법인</option>
                                    <option value="13">사회복지법인</option>
                                    <option value="14">기타공익법인</option>
                                    <option value="18">법인격없는 단체</option>
                                    <option value="19">유한책임회사</option>
                                    <option value="99">기타법인</option>
                                </select>
                            </div>
                            <p class="txt_caption">
                                업체명 항목에 순수기업명을 입력하시기 바랍니다.<br> <strong class="mt6 bold">(예:‘주식회사
                                가나’, ‘㈜가나’, ‘의료법인가나’인 경우 ‘가나’만 입력)</strong>
                            </p>
                        </div>

                        <!-- 대표자명, 연락처, 이메일 -->
                        <div class="gold_line">
                            <h4 class="tit17">* 대표자명</h4>
                                <span class="in_area">
                                    <input type="text" maxlength="5" name="corpManager" class="insert_input"
                                           placeholder="대표자명" required style {
                                           background: #fff;
                                           border-radius: 10px;
                                           outline: none;
                                           border: 2px solid #ddd;
                                           padding: 7px 10px;
                                           font-size: 15px;
                                           font-weight: 500;
                                           color: #444;
                                           }></span>

                            <h4 class="tit17">* 대표 연락처</h4>
                                <span class="in_area">
                                    <input type="tel" maxlength="11" name="phoneNo" class="insert_input"
                                           placeholder="(-없이)01012345678" required style {
                                           background: #fff;
                                           border-radius: 10px;
                                           outline: none;
                                           border: 2px solid #ddd;
                                           padding: 7px 10px;
                                           font-size: 15px;
                                           font-weight: 500;
                                           color: #444;
                                           }></span>

                            <h4 class="tit17" >* 이메일</h4>
                                <span class="in_area">
                                    <input type="email" name="userEmail" class="insert_input"
                                           placeholder="대표 이메일" required style {
                                           background: #fff;
                                           border-radius: 10px;
                                           outline: none;
                                           border: 2px solid #ddd;
                                           padding: 7px 10px;
                                           font-size: 15px;
                                           font-weight: 500;
                                           color: #444;
                                           }></span>
                        </div>
                        <!-- 우편번호, 사업자 등록주소 상세주소 -->
                        <div class="gold_line">
                           <h4>우편번호</h4>
                           <span id="input_area"><input type="text" name="address"
                           class="postcodify_postcode5"  placeholder="우편번호 검색"></span>
                           <button type="button" id="postcodify_search_button" required>검색</button>
                           <h4>사업자등록상 주소</h4>
                           <span id="input_area"><input type="text" name="userAddress"
                           class="postcodify_address" required></span>
                           <h4>상세주소</h4>
                           <span id="input_area" ><input type="text" name="userAddress"
                           class="postcodify_details" required></span>
                        </div>
                        <!-- 이용약관 -->
                        <div class="gold_line">
                            <h4 class="tit17">* 이용 약관</h4>
                                <form id="contactForm" action="<%=request.getContextPath()%>/login" method="POST">
                                    <p class="f18 mt16">서비스 이용을 위하여 약관 및 개인정보 수집 이용 동의가 필요합니다.</p>
                                    <dl class="agreement_area2">
                                        <dt>
                                            <div>
                                                <input type="checkbox" id="allChk" name="checkBoxAll"
                                                       class="checkBoxAll" value='selectall' onclick='selectAll(this)'
                                                       required>
                                                <label for="allChk" style="padding-bottom: 10px">전체동의</label>
                                            </div>
                                        </dt>
                                        <dt>
                                            <input type="checkbox" id="terms1" name="chk">
                                            <label for="d2">[필수] 회원가입약관</label>

                                            <a href="javascript:doDisplay();">
                                                <button type="button" id="ctn-btn"><span class="blind">내용보기</span>
                                                </button>
                                            </a>
                                        </dt>

                                        <dd>
                                            <!-- 약관 샘플 -->
                                            <div class="scroll_type" tabindex="0" id="myDIV" style="display:none;">
                                                <div class="agreement_area">
                                                    <h5 class="tit_least">제1조 (목적)</h5>
                                                    <p>본 약관은 내손을자바팀의 근짱과 이용 고객(이하 ‘회원’이라 합니다)
                                                        간에 회사가 제공하는 구체적으로 규정함을 목적으로 합니다.</p>

                                                    <h5 class="tit_least">제2조 (약관의 효력발생 및 변경)</h5>
                                                    <ol>
                                                        <li>이 약관에 명시되었거나 향후 첨부되는 부속서류 및 정보서비스의 공지사항을 통하여
                                                            공시되는 내용물은 이 약관의 일부로서 효력을 발생합니다.
                                                        </li>
                                                        <li>약관의 내용에 변경이 있을 경우에는 회사가 서면으로 통보하거나 정보서비스의
                                                            공지사항에 의하여 공시하며, 통보 또는 공시 후 2주 내에 이의제기가 없으면 그
                                                            변경에 동의한 것으로 봅니다.
                                                        </li>
                                                    </ol>

                                                    <h5 class="tit_least">제3조 (용어의 정의)</h5>
                                                    <p>이 약관에 사용하는 용어의 정의는 다음 각 호와 같습니다.</p>

                                                    <ol>
                                                        <li>‘회원’이라 함은 이 약관에 동의하고 서비스를 이용하는 이용자를 말합니다.
                                                        </li>
                                                        <li>‘이용계약’이라 함은 이 약관을 포함하여 서비스 이용과 관련하여 회사와 회원
                                                            간에 체결하는 모든 계약을 말합니다.
                                                        </li>
                                                        <li>‘회원ID’라 함은 회원의 식별 및 서비스 이용을 위하여 회원의 신청에 따라
                                                            회사가 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.
                                                        </li>
                                                        <li>‘비밀번호’라 함은 회원ID로 식별되는 회원의 본인 여부를 검증하기 위하여
                                                            회원이 설정하여 회사에 등록한 고유의 문자와 숫자의 조합을 말 합니다.
                                                        </li>
                                                        <li>‘공지사항’이라 함은 회사가 정보 서비스 이용자에게 전산망을 통하여 고지하는
                                                            내용을 게시하는 정보 서비스 상의 영역을 말합니다.
                                                        </li>
                                                        <li>‘해지’라 함은 회사 또는 회원이 이용계약을 해약하는 것을 말합니다.</li>
                                                    </ol>

                                                    <h5 class="tit_least">제4조 (이용계약의 성립)</h5>
                                                    <ol>
                                                        <li>이용계약은 이용자의 이용계약 내용에 대한 동의와 이용신청에 대하여 회사의
                                                            이용승낙으로 성립합니다.
                                                        </li>
                                                        <li>이용계약에 대한 동의는 이용신청 당시 신청서상의 ‘동의함’ 버튼을 누름으로써
                                                            의사표시를 합니다.
                                                        </li>
                                                    </ol>

                                                    <h5 class="tit_least">제5조 (서비스 이용 신청)</h5>
                                                    <ol>
                                                        <li>회원으로 가입하여 서비스를 이용하고자 하는 이용자는 회사에서 요청하는 제반
                                                            정보(이용자ID, 비밀번호, 이름, 연락처 등)를 제공하여야 합니다.
                                                        </li>
                                                        <li>모든 회원은 반드시 회원 본인의 정보를 제공하여야만 서비스를 이용할 수 있으며,
                                                            타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를
                                                            등록하지 않은 회원은 서비스 이용과 관련하여 아무런 권리를 주장할 수 없으며,
                                                            관계 법령에 따라 처벌 받을 수 있습니다.
                                                        </li>
                                                        <li>회원가입은 반드시 본인의 진정한 정보를 통하여만 가입할 수 있으며 회사는 회원이
                                                            등록한 정보에 대하여 확인조치를 할 수 있습니다. 회원은 회사의 확인조치에
                                                            대하여 적극 협력하여야 하며, 만일 이를 준수하지 아니할 경우 회사는 회원이
                                                            등록한 정보가 부정한 것으로 처리할 수 있습니다.
                                                        </li>
                                                    </ol>

                                                    <h5 class="tit_least">제5조의2 (개인정보 파기에 대한 특례)</h5>
                                                    <ol>
                                                        <li>회사는 서비스를 1년 이상 이용하지 않는 회원에 관하여 회원의 요청에 따라
                                                            회원의 개인정보를 저장·관리합니다.
                                                        </li>
                                                        <li>이용계약이 해지될 경우 회사는 제1항의 개인정보를 파기하여야 합니다.</li>
                                                    </ol>

                                                    <h5 class="tit_least">제6조 (이용자 자격 상실)</h5>
                                                    <p>이용자가 다음 각 호의 사유에 해당하는 경우, 회사는 이용자의 회원자격을 적절한 방법으로
                                                        제한 및 정지, 상실시킬 수 있습니다.</p>

                                                    <ol>
                                                        <li>가입신청 시에 허위 내용을 등록한 경우</li>
                                                        <li>다른 사람의 내손을자바 서비스 이용을 방해하거나 그 정보를 도용하는 등
                                                            전자거래질서를 문란하게 한 경우
                                                        </li>
                                                        <li>법령과 본 약관이 금지하거나 공서 양속에 반하는 행위를 하는 경우</li>
                                                    </ol>

                                                    <h5 class="tit_least">제7조 (회사의 의무)</h5>
                                                    <ol>
                                                        <li>회사는 회원이 희망한 서비스 제공 개시일에 특별한 사정이 없는 한 서비스를
                                                            이용할 수 있도록 하여야 합니다.
                                                        </li>
                                                        <li>회사는 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 멸실된
                                                            떼에는 부득이한 사유가 없는 한 지체없이 이를 수리 또는 복구합니다.
                                                        </li>
                                                        <li>회사는 회원의 정보를 철저히 보안 유지하며, 양질의 서비스를 운영하거나
                                                            개선하는데에만 사용하고 이 이외의 다른 목적으로 타 기관 및 개인에게 양도하지
                                                            않습니다.
                                                        </li>
                                                        <li>본 웹사이트는 프로젝트 진행시에만 사용됨을 고지드립니다.
                                                            다른 목적으로 사용을 금합니다.
                                                        </li>
                                                    </ol>

                                                    <h5 class="tit_least">제8조 (회원의 의무)</h5>
                                                    <ol>
                                                        <li>회원은 회원가입 신청 또는 회원정보 변경 시 모든 사항을 사실에 근거하여 회원의
                                                            전정한 정보로 작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 이와
                                                            관련된 모든 권리를 주장할 수 없습니다.
                                                        </li>
                                                        <li>회원은 약관에서 규정하는 사항과 기타 회사가 정한 제반 규정, 공지사항 등
                                                            회사가 공지하는 사항 및 관계 법령을 준수하여야 하며, 기타 회사의 업무에
                                                            방해가 되는 행위, 회사의 명예를 손상시키는 행위, 타인에게 피해를 주는 행위를
                                                            해서는 안됩니다.
                                                        </li>
                                                        <li>회원은 주소, 연락처, 담당자 정보 등 이용계약사항이 변경된 경우에 해당 절차를
                                                            거쳐 이를 회사에 즉시 알려야 합니다.
                                                        </li>
                                                        <li>ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있습니다.</li>
                                                        <li>자신의 ID가 부정하게 사용된 경우, 회원은 반드시 회사에 그 사실을 통보하여야
                                                            합니다.
                                                        </li>
                                                    </ol>

                                                    <h5 class="tit_least">제9조 (정보의 제공)</h5>
                                                    <ol>
                                                        <li>회사는 회원에게 서비스 이용에 필요가 있다고 인정되는 각종 정보에 대해서
                                                            전자우편이나 서신, 우편, SMS, 전화 등의 방법으로 회원에게 제공할 수
                                                            있습니다.
                                                        </li>
                                                        <li>회사는 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에
                                                            관련 법령에 따라 추가적인 개인 정보를 수집할 수 있습니다.
                                                        </li>
                                                    </ol>

                                                    <h5 class="tit_least">제10조 (면책사항)</h5>
                                                    <ol>
                                                        <li>회사는 천재지변, 전쟁, 기간통신사업자의 서비스 중지 및 기타 이에 준하는
                                                            불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이
                                                            면제됩니다.
                                                        </li>
                                                        <li>회사는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한
                                                            손해에 대한 책임이 면제됩니다.
                                                        </li>
                                                        <li>회사는 회원의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 정보 및
                                                            전자우편 주소, 담당자 정보를 부실하게 기재하여 손해가 발생한 경우 책임을 지지
                                                            않습니다. 사실 그냥 프로젝트 이므로, 아무런 책임을 지지 않습니다.
                                                        </li>
                                                    </ol>

                                                    <h5 class="tit_least">제11조 (재판권 및 준거법)</h5>
                                                    <ol>
                                                        <li>이 약관에 명시되지 않은 사항은 전기통신사업법 등 대한민국의 관계법령과 상관습에
                                                            따릅니다.
                                                        </li>
                                                        <li>회사의 유료 서비스 이용 회원의 경우 당해 서비스와 관련하여서는 회사가 별도로
                                                            정한 약관 및 정책에 따릅니다.
                                                        </li>
                                                        <li>서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 대한민국
                                                            서울중앙지방법원을 관할 법원으로 합니다.
                                                        </li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <!-- //약관 샘플 -->
                                        </dd>
                                        <dt>
                                            <input type="checkbox" id="terms2" name="chk">
                                            <label for="d3">[필수] 개인정보 수집 및 이용</label>
                                            <a href="javascript:doDisplay1();">
                                                <button type="button" id="ctn-btn"><span class="blind">내용보기</span>
                                                </button>
                                            </a>
                                        </dt>
                                        <dd>
                                            <!-- 개인정보 샘플 -->
                                            <div class="scroll_type" tabindex="0" id="myDIV1" style="display:none;">
                                                <div class="agreement_area">
                                                    <h5 class="tit_least">1. 개인정보 수집 목적</h5>
                                                    <p>내손을자바 팀프로젝트는 공공용 신용평가, 민간용 평가, 당좌용 평가, 기술평가,
                                                        ESG평가 등의 평가서비스와 부가서비스, 정보서비스, 팀 프로젝트등의 제공을 목적으로
                                                        개인정보를 수집합니다.</p>

                                                    <h5 class="tit_least">2. 처리하는 개인정보 항목</h5>
                                                    <p>* 필수 항목 : 아이디, 비밀번호, 기업명, 대표자 성명, 사업장주소,대표자 전화번호, 대표자 핸드펀번호,
                                                        이메일주소</p>

                                                    <h5 class="tit_least">3. 이용 및 보유기간</h5>
                                                    <p>회원탈퇴 또는 계약만료 시 까지</p>

                                                    <h5 class="tit_least">4. 동의 거부할 권리와 미동의 시 그에 따른 불이익사항</h5>
                                                    <p>개인정보 수집 미 동의 시 기업신용평가 서비스를 제공받을 수 없습니다.</p>
                                                </div>
                                            </div>

                                            <!-- //개인정보 샘플 -->
                                        </dd>


                                        <dt>
                                            <input type="checkbox" id="d4" name="chk">
                                            <label for="d4">[선택] 마케팅 정보 수신 동의</label>
                                            <a href="javascript:doDisplay2();">
                                                <button type="button" id="ctn-btn">내용보기</button>
                                            </a>
                                        </dt>
                                        <dd><!-- 마케팅 수신 샘플 -->
                                            <div class="scroll_type" tabindex="0" id="myDIV2" style="display:none;">
                                                <div class="agreement_area">
                                                    <h5 class="tit_least">프로모션 정보수신 동의</h5>
                                                    <p>내손을자바 팀프로젝트가 제공하는 신규 서비스/이벤트/혜택 등 다양한 정보를 문자,
                                                        카카오톡, 이메일 등으로 받아보실 수 있습니다.</p>
                                                </div>
                                            </div>
                                            <!-- //마케팅 수신 샘플 -->
                                        </dd>

                                    </dl>
                                    <div class="btnArea" style="padding: 0;">
                                        <button id="joinBtn" onclick="AgreementYesNoCheck()">가입하기</button>
                                    </div>
                                </form>
                </div>
            </div>
            </body>
            </html>
        </div>
</section>

<!-- 주소 API 스크립트 -->
<!--jQuery와 Postcodify를 로딩한다 -->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script> $(function () { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

<script type="text/javascript">
var bDisplay = true; function doDisplay(){
        var con = document.getElementById("myDIV");
        if(con.style.display=='none'){
            con.style.display = 'block';
        }else{
            con.style.display = 'none';
        }
}
</script>

<script type="text/javascript">
    $('#joinBtn').on('click', function (event) {
        let terms1 = $('#terms1').prop("checked");
        let terms2 = $('#terms2').prop("checked");
        if (!terms1 || !terms2) {
            event.preventDefault();
            alert("모든 약관에 동의해야 합니다.");
        }
    });

</script>

<script type="text/javascript">
    var bDisplay = ture;

    function doDisplay1() {
        var con = document.getElementById("myDIV1");
        if (con.style.display == 'none') {
            con.style.display = 'block';
        } else {
            con.style.display = 'none';
        }
    }
</script>

<script type="text/javascript">
    function doDisplay2() {
        var con = document.getElementById("myDIV2");
        if (con.style.display == 'none') {
            con.style.display = 'block';
        } else {
            con.style.display = 'none';
        }
    }
</script>

<script type="text/javascript">
    function selectAll(selectAll) {
        const checkboxes
            = document.getElementsByName('chk');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
    }
</script>

<script type="text/javascript">
    function execution_add_address() {
        <!-- 주소 합치기 -->
//내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var finalAddress = ''; // 주소 변수
//사용자가 입력한 상세주소에 따라 해당 주소 값을 finalAddress 에 담는다. data 여기 바꿔야할듯?
        if (data.address2 !== '') { //만약 상세주소가 null이 아니면
            finalAddress = data.data.userAddress + ' (' + address2 + ')';
        } else { // 상세 주소가 없을경우 구냥 주소만 넣기.
            finalAddress = data.userAddress;
        }
        // 주소변수 문자열과 참고항목 문자열 합치기
        data.userAddress = finalAddress;
    }
</script>

<script type="text/javascript">
    function idCheck() {
        $.ajax({
            url: "/user/joinIdCheck",
            type: "POST",
            dataType: "JSON",
            data: {"userID": $("#userID").val()},
            success: function (data) {
                console.log(data);
                if (data == 0) {
                    $("#userID").attr("value", "Y");
                    $('.useId_ok').css("display", "inline-block");
                    $('.useId_already').css("display", "none");
                } else if (data >= 1) {
                    $('.useId_already').css("display", "inline-block");
                    $('.useId_ok').css("display", "none");
                    $('#useId_ok').val('');
                    $('#userID').val('');
                    $('#userID').focus();
                }
            },
            error: function () {
                alert("에러입니다." + data);
            }
        });
    }
</script>

<!— 비번 틀렸을때 —>
<script type="text/javascript">
    $('#pw2').blur(function () {
        let pass1 = $("#pw").val();
        let pass2 = $("#pw2").val();
        if (pass1 != "" || pass2 != "") {
            if (pass1 == pass2) {
                $("#checkPw").html('패스워드가 일치합니다.');
                $("#checkPw").attr('color', 'green');
                $("#checkPw").css('color', 'green', 'important');
            } else {
                $("#checkPw").html('패스워드가 불일치합니다.');
                $("#checkPw").attr('color', 'red');
                $("#checkPw").css('color', 'red', 'important');
                $('#pw2').val('');
                $('#pw2').focus();
            }
        }
    })

    /*영문(대소문자) 포함
       숫자 포함
       특수 문자 포함
       공백 X
       비밀번호 자리 8~15자 */
    $('#pw2').blur(function chkPW() {
        var pw = $("#pw2").val();
        var num = pw.search(/[0-9]/g);
        var eng = pw.search(/[a-z]/ig);
        var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        if (pw.length < 8 || pw.length > 15) {

            alert("8자리 ~ 15자리 이내로 입력해주세요.");
            $('#pw').val('');
            $('#pw2').val('');
            $('#pw').focus();
            return false;
        } else if (pw.search(/\s/) != -1) {
            alert("비밀번호는 공백 없이 입력해주세요.");
            $('#pw').val('');
            $('#pw2').val('');
            $('#pw').focus();
            return false;
        } else if (num < 0 || eng < 0 || spe < 0) {
            alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
            $('#pw').val('');
            $('#pw2').val('');
            $('#pw').focus();
            return false;
        } else {
            return true;
        }

    })

</script>


<!-- 동의하는거 버튼 -->
<script type="text/javascript">
    function AgreementYesNoCheck() {
        if (document.querySelector("input[name='d2']:checked").value == "y") {
            document.getElementById("contactForm").submit();
        } else {
            alert('이용약관에 동의하지 않았습니다.');
        }
    }
</script>

<%@ include file="/WEB-INF/views/include/footer.jspf" %>

