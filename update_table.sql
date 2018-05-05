USE bus_position_log;
CREATE TABLE positions_new LIKE positions;
ALTER TABLE positions_new MODIFY COLUMN ar VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN bid VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN c VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN cars VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN consist VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN d VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN dd VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN dn VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN fs VARCHAR(60);
ALTER TABLE positions_new MODIFY COLUMN id VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN m VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN op VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN pd VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN pdRtpiFeedName VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN pid VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN rt VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN rtRtpiFeedName VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN rtdd VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN rtpiFeedName VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN run VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN wid1 VARCHAR(20);
ALTER TABLE positions_new MODIFY COLUMN wid2 VARCHAR(20);
INSERT INTO positions_new (ar,bid,c,c,cars,consist,d,dd,dn,fs,id,m,op,pd,pdRtpiFeedName,pid,rt,rtRtpiFeedName,rtdd,rtpiFeedName,run,wid1,wid2,timestamp) SELECT * FROM positions;
RENAME TABLE positions TO positions_old, positions_new TO positions;
DROP TABLE positions_old;
