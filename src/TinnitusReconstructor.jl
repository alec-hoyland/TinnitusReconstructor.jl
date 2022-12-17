module TinnitusReconstructor

using FFTW
using LinearAlgebra
using Statistics, StatsBase
using PortAudio, SampledSignals
using FileIO
using LibSndFile
using DSP
using Memoize
using FastBroadcast

include("funcs.jl")
include("StimGens.jl")
include("generate_stimuli.jl")

export UniformPrior
export present_stimulus
export generate_stimuli_matrix
export generate_stimulus, generate_stimulus_new
export freq_bins
export spect2binnedrepr, wav2spect
export subject_selection_process
export cs, gs
export get_fs, get_nfft, mels2hz, hz2mels
export empty_spectrum
export synthesize_audio

function present_stimulus(s::Stimgen)
    stimuli_matrix, Fs, _, _ = generate_stimuli_matrix(s)
    play_scaled_audio.(stimuli_matrix[:, 1], Fs)
    return nothing
end

end
