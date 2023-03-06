<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jspf" %>

<%--   @@@@@@@@@@여기까지 헤더@@@@@@@@@   --%>
      <!-- Header-->
      <header class="bg-warning py-5">
        <div class="container px-5">
          <div class="row gx-5 align-items-center justify-content-center">
            <div class="col-lg-8 col-xl-7 col-xxl-6">
              <div class="my-5 text-center text-xl-start">
                <h1 class="display-5 fw-bolder text-white mb-2">
                  <c:choose>
                  <c:when test="${login!=null}">
                    ${login.corpManager}
                    <c:choose>
                      <c:when test="${login.managerClassification==1}">
                        관리자
                      </c:when>
                    </c:choose>
                    님 환영합니다!<br>
                  </c:when>
                  </c:choose>
                  신용평가가 처음이신가요?
                </h1>
                <p class="lead fw-normal text-white-50 mb-4">
                  웹 페이지에서 손쉽게 신용정보를 등록하여 내 기업의 신용 등급과
                  등급의 상대적 위치를 한눈에 볼 수 있습니다!
                </p>
                <div
                  class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start"
                >
                  <a
                    class="btn"
                    href="#features"
                    >시작하기</a
                  >
                  <a class="btn" href="#!"
                    >더 보기</a
                  >
                </div>
              </div>
            </div>
            <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
              <img
                class="img-fluid rounded-3 my-5"
                src="https://www.seoulcredit.co.kr/wp-content/uploads/2023/02/m_bank.webp"
                alt="..."
              />
            </div>
          </div>
        </div>
      </header>
      <!-- Features section-->
      <section class="py-5" id="features">
        <div class="container px-5 my-5">
          <div class="row gx-5">
            <div class="col-lg-4 mb-5 mb-lg-0">
              <h2 class="fw-bolder mb-0">신용을 자바 팀프로젝트</h2>
            </div>
            <div class="col-lg-8">
              <div class="row gx-5 row-cols-1 row-cols-md-2">
                <div class="col mb-5 h-100">
                  <div
                    class="feature bg-primary bg-gradient text-white rounded-3 mb-3"
                  >
                    <i class="bi bi-collection"></i>
                  </div>
                  <h2 class="h5">회원가입</h2>
                  <p class="mb-0">
                    -아이디 중복 확인<br>
                    -비밀번호 8~15자리<br>
                    -영문, 숫자, 특수기호 포함<br>
                    -주소찾기 (우편번호+상세주소 합쳐서 DB에 저장)<br>
                    -약관동의<br>
                  </p>
                </div>
                <div class="col mb-5 h-100">
                  <div
                    class="feature bg-primary bg-gradient text-white rounded-3 mb-3"
                  >
                    <i class="bi bi-building"></i>
                  </div>
                  <h2 class="h5">로그인</h2>
                  <p class="mb-0">
                    -회원 가입한 아이디 & 비밀번호로 로그인<br>
                    -비밀번호 찾기 : 이메일로 임시 비밀번호 발송<br>
                    -자동 로그인<br>
                  </p>
                </div>
                <div class="col mb-5 mb-md-0 h-100">
                  <div
                    class="feature bg-primary bg-gradient text-white rounded-3 mb-3"
                  >
                    <i class="bi bi-toggles2"></i>
                  </div>
                  <h2 class="h5">신용평가</h2>
                  <p class="mb-0">
                    -약관 동의 후 신용정보 입력<br>
                    -필수서류 제출 후 평가 대기<br>
                    -평가 결과 확인<br>
                  </p>
                </div>
                <div class="col h-100">
                  <div
                    class="feature bg-primary bg-gradient text-white rounded-3 mb-3"
                  >
                    <i class="bi bi-toggles2"></i>
                  </div>
                  <h2 class="h5">고객센터</h2>
                  <p class="mb-0">
                    -신용평가 Q&A<br>
                    -자주묻는질문<br>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Testimonial section-->
      <div class="py-5 bg-light">
        <div class="container px-5 my-5">
          <div class="row gx-5 justify-content-center">
            <div class="col-lg-10 col-xl-7">
              <div class="text-center">
                <div class="fs-4 mb-4 fst-italic">
                  "어디에 제출 하시나요?
                   민간기업
                   공공기관
                   금융기관
                   자사진단"
                </div>
                <div class="d-flex align-items-center justify-content-center">
                  <img
                    class="rounded-circle me-3"
                    src="../resources/images/1243928.png"
                    alt="..."
                  />
                  <div class="fw-bold">
                    Credit JAVA
                    <span class="fw-bold text-primary mx-1">/</span>
                    CEO
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Blog preview section-->
      <section class="py-5">
        <div class="container px-5 my-5">
          <div class="row gx-5 justify-content-center">
            <div class="col-lg-8 col-xl-6">
              <div class="text-center">
                <h2 class="fw-bolder">From our blog</h2>
                <p class="lead fw-normal text-muted mb-5">
                  Credit JAVA TEAM
                </p>
              </div>
            </div>
          </div>
          <div class="row gx-5">
            <div class="col-lg-4 mb-5">
              <div class="card h-100 shadow border-0">
                <img
                  class="card-img-top"
                  src="../resources/images/teamPhoto3.jpg"
                  alt="..."
                />
                <div class="card-body p-4">
                  <div class="badge bg-primary bg-gradient rounded-pill mb-2">
                    News
                  </div>
                  <a
                    class="text-decoration-none link-dark stretched-link"
                    href="#!"
                    ><h5 class="card-title mb-3">프로젝트 회의</h5></a
                  >
                  <p class="card-text mb-0">
                    <요구사항 점검><br>
                    -신용평가 내용 정리<br>
                    -ERD 수정<br>
                    -각 기능 담당자 확정<br>
                  </p>
                </div>
                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                  <div class="d-flex align-items-end justify-content-between">
                    <div class="d-flex align-items-center">
                             <img
                                              class="rounded-circle me-3"
                                              src="../resources/images/1243928.png" width="150"
                                              alt="..."
                                            />
                      <div class="small">
                        <div class="fw-bold">Credit JAVA TEAM</div>
                        <div class="text-muted">
                          Feb 20, 2023 &middot;
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 mb-5">
              <div class="card h-100 shadow border-0">
                <img
                  class="card-img-top"
                  src="../resources/images/teamPhoto1.jpg"
                  alt="..."
                />
                <div class="card-body p-4">
                  <div class="badge bg-primary bg-gradient rounded-pill mb-2">
                    Media
                  </div>
                  <a
                    class="text-decoration-none link-dark stretched-link"
                    href="#!"
                    ><h5 class="card-title mb-3">프로젝트 회의</h5></a
                  >
                  <p class="card-text mb-0">
                    <기능 점검><br>
                    -각 담당 기능 설명<br>
                    -기능 수정 및 보완<br>
                    -추가 기능 구현<br>
                  </p>
                </div>
                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                  <div class="d-flex align-items-end justify-content-between">
                    <div class="d-flex align-items-center">
                      <img
                        class="rounded-circle me-3"
                        src="../resources/images/1243928.png" width="150"
                        alt="..."
                      />
                      <div class="small">
                        <div class="fw-bold">Credit JAVA TEAM</div>
                        <div class="text-muted">
                          Feb 27, 2023 &middot;
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 mb-5">
              <div class="card h-100 shadow border-0">
                <img
                  class="card-img-top"
                  src="../resources/images/teamPhoto.jpg"
                  alt="..."
                />
                <div class="card-body p-4">
                  <div class="badge bg-primary bg-gradient rounded-pill mb-2">
                    News
                  </div>
                  <a
                    class="text-decoration-none link-dark stretched-link"
                    href="#!"
                    ><h5 class="card-title mb-3">
                      프로젝트 회의
                    </h5></a
                  >
                  <p class="card-text mb-0">
                   <최종 점검><br>
                                       -디자인 수정<br>
                                       -발표준비<br>
                                       -간담회<br>
                  </p>
                </div>
                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                  <div class="d-flex align-items-end justify-content-between">
                    <div class="d-flex align-items-center">
                      <img
                        class="rounded-circle me-3"
                        src="../resources/images/1243928.png" width="150"
                        alt="..."
                      />
                      <div class="small">
                        <div class="fw-bold">Credit JAVA TEAM</div>
                        <div class="text-muted">
                          March 06, 2023 &middot;
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Call to action-->
          <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
            <div
              class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start"
            >
              <div class="mb-4 mb-xl-0">
                <div class="fs-3 fw-bold text-white">
                  신용을 자바! 신용 평가를 받으시려면 회원가입을 해주세요.
                </div>
                <div class="text-white-50">
                  Sign up for our newsletter for the latest updates.
                </div>
              </div>
              <div class="ms-xl-4">
                <div class="input-group mb-2">
                  <input
                    class="form-control"
                    type="text"
                    placeholder="Email address..."
                    aria-label="Email address..."
                    aria-describedby="button-newsletter"
                  />
                  <button
                    class="btn btn-outline-light"
                    id="button-newsletter"
                    type="button"
                  >
                    Sign up
                  </button>
                </div>
                <div class="small text-white-50">
                  We care about privacy, and will never share your data.
                </div>
              </div>
            </div>
          </aside>
        </div>
      </section>
    </main>
    <!-- Footer-->
<%--   @@@@@@@@@@@여기부터 푸터@@@@@@@@@--%>
    <%@ include file="/WEB-INF/views/include/footer.jspf" %>
