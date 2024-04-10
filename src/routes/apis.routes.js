const express = require('express');
const { getAllProducts, getOneProduct } = require('../controllers/apis/productsApiController');
const { checkEmail } = require('../controllers/apis/usersApisController');
const { addBanner, listBanner } = require('../controllers/apis/indexApiController');
const bannerUpload = require('../middlewares/bannerUpload');
const router = express.Router();

/* /apis */
router
  .get('/products', getAllProducts)
  .get('/products/:id', getOneProduct)
  .get('/users/check-email', checkEmail)
  .get('/banners', listBanner)
  .post('/banners', bannerUpload.any(), addBanner)


module.exports = router;