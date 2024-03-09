const express = require('express');
const controller = require('./controller.js');
const router = express.Router();

router.get('/api/getLogs/', controller.getLogs);
router.post('/api/postLogs/', controller.postLogs);

module.exports = router;