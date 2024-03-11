const mysql = require('./db.js');

class MainController {
    async postLogs(req, res) {
        const { report_type, report_subtype, imageLink, location_x, location_y } = req.body;
        console.log(req.body);
        if (report_type && report_subtype && imageLink && location_x && location_y) {
            const sql = `CALL insert_log('${report_type}', '${report_subtype}', '${imageLink}', ${location_x}, ${location_y})`;
            console.log(sql);
            mysql.query(sql, (error, data) => {
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
