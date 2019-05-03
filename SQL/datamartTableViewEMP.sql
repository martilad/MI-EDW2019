CREATE MATERIALIZED VIEW datamart.dmEPM AS (
	SELECT behaviour.student_id, behaviour.session_id, behaviour.duration, coalesce(final.total, 0) AS total,  coalesce(session.points, 0) AS session_points
	FROM (
		SELECT student_id, session_id, SUM((EXTRACT(epoch FROM (end_time-start_time)))) AS duration
		FROM target.public.behaviour_entry
		GROUP BY student_id, session_id) AS behaviour
	LEFT JOIN (select student_id, MAX(total) AS total FROM target.public.final_exercise_points GROUP BY student_id) AS final ON final.student_id=behaviour.student_id
	LEFT JOIN target.public.session_grade AS session ON session.student_id=behaviour.student_id AND session.session_id=behaviour.session_id
);

REFRESH MATERIALIZED VIEW datamart.dmEPM;
