/**
 * Cooperative navmap A*. Each start/resume call works for about 5ms, then returns a list with
 * `status` (`in_progress`, `complete`, `no_path`, or `error`), an optional `job_id`, and a final
 * `path` for complete/no_path results. Cancel abandoned or superseded jobs.
 *
 * nav_pass bit 13 is the simulated-turf flag and must be set whenever cached turf data is sent to
 * Rust. This keeps `simulated_only` entirely Rust-side for baked turfs.
 */

/**
 * Blocking compatibility wrapper. Returns the final turf list directly; use only for callers that
 * require synchronous behavior. AI movement should use the cooperative start/resume API below.
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
