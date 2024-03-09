const mysql = require('./db.js');

class MainController {
    async postLogs(req, res) {
        const { id_report_type, report_date, imageLink, name, location_x, location_y } = req.body;        
        if (id_report_type && imageLink && name && location_x && location_y) {
            const sql = `INSERT INTO logs (id_report_type, report_date, image, name, location_x, location_y) VALUES (?, NOW(), ?, ?, ?, ?)`;
            const values = [id_report_type, imageLink, name, location_x, location_y];
            
            mysql.query(sql, values, (error, data) => {
                if (error) {
                    res.status(500).json({ error: error.message });
                } else {
                    console.log(data);
                    res.status(200).json({
                        status: 200,
                        message: "Log uploaded successfully",
                        affectedRows: data.affectedRows
                    });
                }
            });
        } else {
            res.status(400).json({ error: 'Please provide all required data' });
        }
    }
    //CHANGED TO GET ALL REPORTS TEMPORARILY
    async getLogs(req, res) {
        const sql = `SELECT * FROM logs`;
        mysql.query(sql, (error, data) => {
            if (error) {
                res.status(500).json({ error: error.message });
            } else {
                console.log(data);
                res.status(200).json({ data });
            }
        });
    }
}

const mainController = new MainController();
module.exports = mainController;
