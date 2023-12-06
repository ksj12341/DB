const express = require("express");
const path = require("path");
const bodyParser = require("body-parser");
const { loginUser } = require("./models/user");

const { fetchReservations, checkoutReservation } = require('./models/check');

const app = express();
const router = express.Router();

app.set("port", process.env.PORT || 8080);
app.use(express.static(path.join(__dirname, "public")));
app.use(express.static(path.join(__dirname, "views")));
app.use(express.static(path.join(__dirname, "models")));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// 홈 페이지 라우트
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "./views/index.html"));
});

// 로그인 처리 라우트
app.post("/login", async (req, res) => {
  const username = req.body.username;
  const password = req.body.password;

  try {
    const user = await loginUser(username, password);

    console.log("로그인 시도:", user);

    if (user) {
      if (user.username.toLowerCase() === "admin") {
        console.log("admin으로 로그인 성공");
        res.sendFile(path.join(__dirname, "./views/adminMain.html"));
      } else {
        console.log("user로 로그인 성공");
        res.sendFile(path.join(__dirname, "./views/userMain.html"));
      }
    } else {
      console.log("로그인 실패");
      res.send("로그인 실패 - 다시 시도하세요");
    }
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
});

// 예약 목록 조회 라우트
router.get('/reservations', async (req, res) => {
  try {
    const reservations = await fetchReservations();  // Use the fetchReservations function
    res.json(reservations);
  } catch (error) {
    console.error('Error getting reservations:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// 등록된 라우트를 Express 앱에 등록
app.use('/api', router);


app.post('/api/checkout/:reservationId', async (req, res) => {
  const reservationId = req.params.reservationId;

  try {
    await checkoutReservation(reservationId);
    res.status(200).send('Checkout successful');
  } catch (error) {
    console.error('Error during checkout:', error);
    res.status(500).send('Internal Server Error');
  }
});

// Start the
// 서버 리스닝
app.listen(app.get("port"), () => {
  console.log(app.get("port"), "번 포트에서 대기 중");
});
