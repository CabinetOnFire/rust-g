/**
 *  Navmap A*. Each start/resume call works for about 5ms, then returns a list with
 * `status` (`in_progress`, `complete`, `no_path`, or `error`), an optional `job_id`, and a final
 * `path` for complete/no_path results. Cancel abandoned or superseded jobs.
 *
 */

// Status values returned by async navmap pathfinder jobs.
#define RUSTG_NAVMAP_PATH_IN_PROGRESS "in_progress"
#define RUSTG_NAVMAP_PATH_COMPLETE "complete"
#define RUSTG_NAVMAP_PATH_NO_PATH "no_path"
#define RUSTG_NAVMAP_PATH_ERROR "error"

/**
 * Synchronous call to the pathfinder, Use this sparingly if you REALLY need immediate results. If you run this on long distances it could take too long.
 */
#define rustg_navmap_pathfinder(start, end, pass_info, is_flying, max_range, min_target_distance, simulated_only, avoid_turf, diagonal_handling, skip_first) \
	RUSTG_CALL(RUST_G, "byond:rustg_navmap_pathfinder_ffi")(start, end, pass_info, is_flying, max_range, min_target_distance, simulated_only, avoid_turf, diagonal_handling, skip_first)

#define rustg_navmap_pathfinder_start(start, end, pass_info, is_flying, max_range, min_target_distance, simulated_only, avoid_turf, diagonal_handling, skip_first) \
	RUSTG_CALL(RUST_G, "byond:rustg_navmap_pathfinder_start_ffi")(start, end, pass_info, is_flying, max_range, min_target_distance, simulated_only, avoid_turf, diagonal_handling, skip_first)

/** Resume an in-progress job. Re-supply the current mover pass_info for any newly resolved conditional edges. */
#define rustg_navmap_pathfinder_resume(job_id, pass_info) \
	RUSTG_CALL(RUST_G, "byond:rustg_navmap_pathfinder_resume_ffi")(job_id, pass_info)

/** Drop an in-progress job immediately. Jobs also expire after 30 seconds without a resume. */
#define rustg_navmap_pathfinder_cancel(job_id) \
	RUSTG_CALL(RUST_G, "byond:rustg_navmap_pathfinder_cancel_ffi")(job_id)

#define rustg_navmap_update(x, y, z, nav_pass) \
	RUSTG_CALL(RUST_G, "byond:rustg_navmap_update_ffi")(x, y, z, nav_pass)

#define rustg_navmap_bulk_update(flat_list) \
	RUSTG_CALL(RUST_G, "byond:rustg_navmap_bulk_update_ffi")(flat_list)
